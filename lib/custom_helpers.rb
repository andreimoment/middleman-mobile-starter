# custom_helpers.rb

module CustomHelpers

  # social links

  def linkedin_link(url: "", title: "", summary: "", source: "")
    linkedin_template = "http://www.linkedin.com/shareArticle?mini=true"
    linkedin_template << "&url=#{url_encode(url)}" unless url.blank?
    linkedin_template << "&title=#{url_encode(title)}" unless title.blank?
    linkedin_template << "&summary=#{url_encode(summary)}" unless summary.blank?
    linkedin_template << "&source=#{url_encode(source)}" unless source.blank?
    # see https://developer.linkedin.com/documents/share-linkedin
    # param    req   rec  limit  desc
    # mini     Yes   Yes  4      Must always be true
    # url      No    Yes  1024   The permanent link to the article. Must be URL encoded
    # title    No    Yes  200    The title of the article. Must be URL encoded
    # source   No    Yes  200    The source of the article. Must be URL encoded. Example: Wired Magazine
    # summary  No    Yes  256    A brief summary of the article. Must be URL encoded. Longer titles will be truncated gracefully with ellipses.
    linkedin_template
  end

  def twitter_link(url: "", text: "",  hashtags: "", via: "")
    twitter_template = "https://twitter.com/intent/tweet?text=#{url_encode(text)}"
    twitter_template << "&url=#{url_encode(url)}" unless url.blank?
    twitter_template << "&hashtags=#{url_encode(hashtags)}" unless hashtags.blank?
    # https://dev.twitter.com/web/tweet-button/web-intent
    # https://twitter.com/intent/tweet
    # text, url, hashtags, via, related, in-reply-to
    twitter_template
  end

  def facebook_link(url: "")
    fb_template = "https://www.facebook.com/sharer/sharer.php?u=#{url_encode(url)}"
    # will pull data from the OG tags on the page
    # for a popup, use the API (but create a fb app first)
  end

  def google_plus_link(url: "")
    fb_template = "https://plus.google.com/share?url=#{url_encode(url)}"
    # https://developers.google.com/+/web/share/#sharelink
    # will pull the OG data from the page
  end

  def email_link(subject: "", body: "")
    email_template = "mailto:"
    email_template << "?subject=#{url_encode(subject)}" unless subject.blank?
    email_template << "&body=#{url_encode(body)}" unless body.blank?

    email_template
  end

  def url_encode(s)
    URI.encode s
  end

  def social_link_popup(href, icon_name, alt)
    if icon_name == "icon-email"
      onclick = onclick="APP.gaq_event('Share', '#{icon_name}');"
    else
      onclick = onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600'); APP.gaq_event('Share', '#{icon_name}'); return false;"
    end
    # <svg class="icon icon-facebook"><use xlink:href="#icon-facebook"></use></svg>
    r = %Q{<a href="#{href}" onclick="#{onclick}" title="#{alt}">
            <svg class="social-icon #{icon_name}"><use xlink:href="##{icon_name}"></use></svg></a>
    }
  end

end


