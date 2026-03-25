#!/bin/bash
# GTM Skills OS Installer
# Install skill packs into your Claude Code skills directory

set -e

SKILLS_DIR="$HOME/.claude/skills"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKS_DIR="$SCRIPT_DIR/packs"
SRC_DIR="$SCRIPT_DIR/skills"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

usage() {
    echo ""
    echo "GTM Skills OS Installer"
    echo ""
    echo "Usage: ./install.sh <pack-name|all|list>"
    echo ""
    echo "Available packs:"
    echo "  gtm-foundations    (16 skills) — ICP, positioning, personas, messaging, pricing"
    echo "  outbound-engine    (15 skills) — Cold email, LinkedIn, calls, sequences, nurture"
    echo "  content-machine    (15 skills) — LinkedIn, blogs, SEO, ads, video, lead magnets"
    echo "  signal-campaigns   (12 skills) — Signal-based lists, triggers, prospecting tools"
    echo "  abm-playbook       (12 skills) — Account mapping, executive outreach, LinkedIn ads"
    echo "  sales-enablement   (16 skills) — Battlecards, proposals, discovery, QBRs, coaching"
    echo "  revops-infra       (16 skills) — Email infra, CRM, enrichment, comp, automation"
    echo "  customer-growth    (14 skills) — Health scoring, churn, upsell, partner programs"
    echo "  events-field       (11 skills) — Event strategy, conferences, booth, webinars, ROI"
    echo "  analytics-ops      (17 skills) — Campaign analysis, attribution, dashboards"
    echo "  freelancer-agency  (10 skills) — Scoping, onboarding, reporting, positioning"
    echo ""
    echo "Other commands:"
    echo "  all                Install all 151 skills (not recommended — see below)"
    echo "  list               List available packs"
    echo "  uninstall          Remove all GTM skills from Claude"
    echo ""
    echo "Examples:"
    echo "  ./install.sh outbound-engine"
    echo "  ./install.sh gtm-foundations outbound-engine"
    echo "  ./install.sh all"
    echo ""
    echo "⚠  Installing more than 50 skills at once may degrade Claude's performance."
    echo "   Start with 1-2 packs that match your role."
    echo ""
}

install_pack() {
    local pack_name="$1"
    local pack_file="$PACKS_DIR/$pack_name.txt"

    if [ ! -f "$pack_file" ]; then
        echo -e "${RED}Error: Pack '$pack_name' not found.${NC}"
        echo "Run ./install.sh list to see available packs."
        return 1
    fi

    local count=0
    while IFS= read -r line; do
        # Skip comments and empty lines
        [[ "$line" =~ ^#.*$ ]] && continue
        [[ -z "$line" ]] && continue

        local skill_name="$line"
        local skill_src="$SRC_DIR/$skill_name"

        if [ ! -d "$skill_src" ]; then
            echo -e "  ${YELLOW}⚠ Skill '$skill_name' not found in repo, skipping${NC}"
            continue
        fi

        cp -r "$skill_src" "$SKILLS_DIR/$skill_name"
        count=$((count + 1))
    done < "$pack_file"

    echo -e "${GREEN}  ✓ Installed $count skills from pack '$pack_name'${NC}"
}

install_all() {
    echo ""
    echo -e "${YELLOW}⚠  Warning: Installing all 151 skills at once is not recommended.${NC}"
    echo "   Claude loads all skill descriptions into context at startup."
    echo "   More than 50 skills can cause triggering collisions and slower responses."
    echo ""
    read -p "Continue anyway? (y/N) " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Cancelled. Try installing a specific pack instead:"
        echo "  ./install.sh outbound-engine"
        exit 0
    fi

    local count=0
    for skill_dir in "$SRC_DIR"/*/; do
        local skill_name=$(basename "$skill_dir")
        cp -r "$skill_dir" "$SKILLS_DIR/$skill_name"
        count=$((count + 1))
    done

    echo -e "${GREEN}✓ Installed $count skills${NC}"
    echo -e "${YELLOW}⚠ Consider disabling skills you don't need in Claude's settings.${NC}"
}

uninstall() {
    echo "This will remove all GTM Skills OS skills from $SKILLS_DIR"
    read -p "Continue? (y/N) " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Cancelled."
        exit 0
    fi

    local count=0
    for skill_dir in "$SRC_DIR"/*/; do
        local skill_name=$(basename "$skill_dir")
        if [ -d "$SKILLS_DIR/$skill_name" ]; then
            rm -rf "$SKILLS_DIR/$skill_name"
            count=$((count + 1))
        fi
    done
    echo -e "${GREEN}✓ Removed $count skills${NC}"
}

list_packs() {
    echo ""
    echo "Available packs:"
    echo ""
    for pack_file in "$PACKS_DIR"/*.txt; do
        local pack_name=$(basename "$pack_file" .txt)
        local desc=$(head -1 "$pack_file" | sed 's/^# //')
        local count=$(grep -v '^#' "$pack_file" | grep -v '^$' | wc -l | tr -d ' ')
        printf "  %-22s %s\n" "$pack_name" "$desc"
    done
    echo ""
}

# --- Main ---

if [ $# -eq 0 ]; then
    usage
    exit 0
fi

# Create skills directory if it doesn't exist
mkdir -p "$SKILLS_DIR"

case "$1" in
    list)
        list_packs
        ;;
    all)
        install_all
        ;;
    uninstall)
        uninstall
        ;;
    -h|--help|help)
        usage
        ;;
    *)
        echo ""
        echo "Installing skills to $SKILLS_DIR"
        echo ""
        for pack in "$@"; do
            install_pack "$pack"
        done
        echo ""
        echo "Done. Restart Claude Code and type /skills to see your new skills."
        echo ""
        ;;
esac
