From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: simplify gpiochip_export()
Date: Wed, 23 Jul 2014 17:38:15 +0200
Message-ID: <CACRpkdZj4VSot1pABvo=UT7Qq7CZJ1HPhbJKc29nU8zhOLuKug@mail.gmail.com>
References: <1406013463-19218-1-git-send-email-acourbot@nvidia.com>
	<1406013463-19218-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406013463-19218-3-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 22, 2014 at 9:17 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> For some reason gpiochip_export() would invalidate all the descriptors
> of a chip if exporting it to sysfs failed. This does not appear as
> necessary. Remove that part of the code.
>
> While we are at it, add a note about the non-safety of temporarily
> releasing a spinlock in the middle of the loop that protects its
> iterator, and explain why this is done.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
