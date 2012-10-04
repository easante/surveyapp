
  <div class="row">
    <div class="span9 offset2">
      <%= form_tag user_answers_path  do %>
        <table class="table table-striped">
          <tbody>
            <% number = 0 %>
              <%= render "#{@answer.current_step}" %>
            <%# end %>

          </tbody>
        </table>

        <p><%= submit_tag 'Continue' %></p>

      <%= debug(params) %>

      <% end %>
    </div>
  </div>
