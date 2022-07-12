<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="부트스트랩"><use xlink:href="#bootstrap"></use></svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-dark"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">MAIN</font></font></a></li>
      </ul>

      <form class="row g-3" method="post" action="login">
        <div class="col-auto">
          <label for="mem_id" class="visually-hidden">id</label>
          <input type="password" class="form-control" id="mem_id" name="mem_id" placeholder="id">
        </div>
        <div class="col-auto">
          <label for="mem_pw" class="visually-hidden">Password</label>
          <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="Password">
        </div>
        <div class="col-auto">
          <button type="submit" class="btn btn-primary mb-3">Confirm identity</button>
        </div>
      </form>

      <div class="container">
        <nav class="navbar navbar-expand-lg bg-light">
          <div class="container-fluid">
            
            <ul id="nav5" class="nav justify-content-around bg-light">
              <li class="nav-item">
                  <a class="nav-link active" href="#">Home</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#">Link1</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#">Link2</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#">Link3</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#">Link4</a>
              </li>
          </ul>

            <form class="d-flex" role="search">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

          </div>
        </nav>
      </div>

    </header>
  </div>