From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: APUv2/v3 board support V2
Date: Thu, 14 Feb 2019 14:33:02 +0200
Message-ID: <CAHp75VeL8Z1EE=vh6VG18ecDxp9Zq4XKmnxc=PHZnNxKqc_BMg@mail.gmail.com>
References: <1550091448-28578-1-git-send-email-info@metux.net>
 <CAHp75VeZSrxoxd298eFiJj-N_MRsCXa2GEAXry5jCUi6twt_Xg@mail.gmail.com> <fadb3559-d397-04c9-1bdd-e4d625cce278@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fadb3559-d397-04c9-1bdd-e4d625cce278@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 1:37 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 14.02.19 03:17, Andy Shevchenko wrote:

> > I dunno how you created this message, I hope you used --cover-letter
> > parameter to git-format-patch.
>
> I'm using: git send-email --compose <...>
>
> > Just don't forget to add -v<N>, where <N> is version.
>
> hmm, git send-email doesn't seem to have a corresponding flag :(

It's there from several releases. But it's not a send-email option,
it's format-patch one.
send-email passes those commands to format-patch.

Perhaps time to update your ancient version of git tools? :-)

-- 
With Best Regards,
Andy Shevchenko
