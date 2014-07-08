From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 3/3] gpio: move integer GPIO support to its own file
Date: Tue, 8 Jul 2014 10:25:53 +0200
Message-ID: <CACRpkdYyqNJm9Eoi7uhMKdZt37LVEK+bhWNbuEVfXuQya8BmDw@mail.gmail.com>
References: <1404193516-4384-1-git-send-email-acourbot@nvidia.com>
	<1404193516-4384-4-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404193516-4384-4-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 1, 2014 at 7:45 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> The old integer GPIO interface is, in effect, a privileged user of the
> gpiod interface. Reflect this fact further by moving legacy GPIO support
> into its own source file. This makes the code clearer and will allow us
> to disable legacy GPIO support in the (far) future.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
