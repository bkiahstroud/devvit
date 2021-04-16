# Hints

- Ensuring the browser renders expected content
  - `response.body` in request specs can be used similarly to how `page` is used in feature specs
  - `include` in request specs can be used similarly to how `have_content` is used in feature specs
- Finding the right url helper / request path
  - Running `rails routes` in the terminal will print out all the routes in the application
    - Result can be filtered using `grep`. Example:
    ```sh
    rails routes | grep 'new_post'
    rails routes | grep '/posts/new'
    rails routes | grep 'posts#new'
    ```
