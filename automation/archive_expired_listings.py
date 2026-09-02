from datetime import datetime
import json

# Mock donation listings
listings = [
    {
        "id": "L001",
        "food": "Rice and Curry",
        "expiry_date": "2026-09-01",
        "status": "active"
    },
    {
        "id": "L002",
        "food": "Bread",
        "expiry_date": "2026-09-05",
        "status": "active"
    },
    {
        "id": "L003",
        "food": "Vegetable Meals",
        "expiry_date": "2026-08-30",
        "status": "active"
    }
]

today = datetime.now().date()
archived_listings = []

# Check every listing
for listing in listings:
    expiry_date = datetime.strptime(
        listing["expiry_date"], "%Y-%m-%d"
    ).date()

    if expiry_date < today and listing["status"] == "active":
        listing["status"] = "archived"
        listing["archived_at"] = datetime.now().isoformat()

        archived_listings.append(listing)

# Create audit log
log = {
    "archived_count": len(archived_listings),
    "archived_at": datetime.now().isoformat(),
    "archived_listings": archived_listings
}

with open("archive_log.json", "w") as file:
    json.dump(log, file, indent=4)

print(f"Archived {len(archived_listings)} expired listing(s).")
print("Audit log created: archive_log.json")