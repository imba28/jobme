class TaskAddedMailer < ApplicationMailer
  def notify(user, task)
    if(user.email and user.email.length > 4) then
      @user = user
      @task  = task
      mail(to: @user.email, subject: 'task-o-mat: Neue Aufgabe!')
    end
  end
end