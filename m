From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ich: set regs and reglen for i3100 and ich6 chipset
Date: Tue, 22 Apr 2014 23:15:15 +0200
Message-ID: <CACRpkdYUtiW78=3tiyGBb31THHNYHjm55wLPFfUqnX1nyJnnqA@mail.gmail.com>
References: <20140415084056.GA26578@ks3318809.kimsufi.com>
	<1397564503-5175-1-git-send-email-vincent.donnefort@seagate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397564503-5175-1-git-send-email-vincent.donnefort@seagate.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, eparis@redhat.com, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 15, 2014 at 2:21 PM, Vincent Donnefort <vdonnefort@gmail.com> wrote:

> From: Vincent Donnefort <vdonnefort@gmail.com>
>
> This patch fixes kernel NULL pointer BUG introduced by the following commit:
> b667cf488aa9476b0ab64acd91f2a96f188cfd21
> gpio: ich: Add support for multiple register addresses.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

Patch applied for fixes with Eric's tested-by tag.

Thanks!
Linus Walleij
