module UsersHelper
  def user_profile_link_with_icon(user, size: 24, **options)
    return unless user

    path = user == current_user ? mypage_path : user_path(user)

    link_to path, class: "flex items-center gap-2 #{options[:class]}" do
      icon = image_tag(user.icon_image.url, class: "rounded-full", style: "width: #{size}px; height: #{size}px; object-fit: cover;")
      concat(icon)
      concat(content_tag(:span, user.name, class: "font-medium text-sm"))
    end
  end
end
