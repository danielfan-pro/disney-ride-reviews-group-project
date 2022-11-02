import React, { useState, Fragment } from "react";

const SearchBar = (props) => {
  const [searchString, setSearchString] = useState("");

  const handleChange = (event) => {
    const newSearchString = event.target.value;
    setSearchString(newSearchString);
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    const body = JSON.stringify({
      search_string: searchString,
    });

    try {
      const response = await fetch("/api/v1/rides/search", {
        method: "POST",
        credentials: "same-origin",
        body: body,
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
      });

      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        throw new Error(errorMessage);
      }
      const responseBody = await response.json();
      props.setRides(responseBody.rides);
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`);
    }
  };
  return (
    <Fragment>
      <form onSubmit={handleSubmit}>
        <label>Search</label>
        <input
          type="text"
          name="searchString"
          value={searchString}
          onChange={handleChange}
        />

        <input type="submit" value="Submit" />
      </form>
    </Fragment>
  );
};

export default SearchBar;
