From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: make of_get_named_gpiod_flags() private
Date: Fri, 23 May 2014 09:34:06 +0200
Message-ID: <CACRpkdbpFv_7Up93tz68nKU1doZzgauMKKhZ7UHAS1KAnZ5wfA@mail.gmail.com>
References: <1400306090-4092-1-git-send-email-acourbot@nvidia.com>
	<CACRpkdbfNpx6fHZyQTP1X3NSxBe_u2OXLgnNOmLuKvYq9ghprA@mail.gmail.com>
	<CAAVeFu+8MQwBtUaz5r84zGgJZMLns1XzOkUWTtd+mTk6VF-ieQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFu+8MQwBtUaz5r84zGgJZMLns1XzOkUWTtd+mTk6VF-ieQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 23, 2014 at 5:34 AM, Alexandre Courbot <gnurou@gmail.com> wrote:

> Looks like the world did not break this time. However I noticed that
> the commit in your tree (and -next) included the changes since v1 in
> its log. Is it intended?

Yeah I copy that into the changelog sometimes. If I need that info
it's easier to have it in the commit message than looking up the mail.
Grant had this preference too.

Yours,
Linus Walleij
