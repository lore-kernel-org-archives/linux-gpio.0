From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 1/3] gpio: always compile label support
Date: Tue, 8 Jul 2014 10:17:19 +0200
Message-ID: <CACRpkdZ9Uyk_GwcYt-VgBkgWTZfqJppp6HLYoPMs5tWWWxGJVA@mail.gmail.com>
References: <1404193516-4384-1-git-send-email-acourbot@nvidia.com>
	<1404193516-4384-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404193516-4384-2-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 1, 2014 at 7:45 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Compiling out GPIO labels results in a space gain so small that it can
> hardly be justified. Labels can also be useful for printing debug
> messages, so always keep them around.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
