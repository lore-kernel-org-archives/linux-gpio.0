From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH 40/50] pinctrl: lpc18xx: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 16:06:02 +0100
Message-ID: <CAGhQ9Vzoosj=SpSn-fj1thL9bdfW+cay_truUR9VF8nP9HUwbg@mail.gmail.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
	<1456319775-3216-41-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-41-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, corbet@lwn.net, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Hi Laxman,

On 24 February 2016 at 14:16, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> Use devm_pinctrl_register() for pin control registration.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Joachim Eastwood <manabian@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-lpc18xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Joachim Eastwood <manabian@gmail.com>


regards,
Joachim Eastwood
