def MyRank(users, id):
    for index, user in enumerate(users):
        if user['userId'] == id:
            return index
    else:
        print(f"{id} not found in the dictionary")
        return 0


def getRank(users):
    def sort_by_points(listofusers):
        sorted_arr = sorted(
            listofusers, key=lambda x: x["Points"], reverse=True)
        return sorted_arr

    return sort_by_points(users)
