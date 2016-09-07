From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: bcm281xx: constify pinctrl_ops and
 pinmux_ops structures
Date: Wed, 7 Sep 2016 22:41:53 +0200
Message-ID: <CACRpkdbeSydOEFvt3MOj7wcrZEeWVYeotsE745ObFJB4htOfZw@mail.gmail.com>
References: <1472755341-9995-1-git-send-email-Julia.Lawall@lip6.fr> <1472755341-9995-4-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1472755341-9995-4-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 1, 2016 at 8:42 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Check for pinctrl_ops and pinmux_ops structures that are only stored in the
> pctlops field and the pmxops field, respectively, of a pinctrl_desc
> structure.  These fields are declared const, so pinctrl_ops and pinmux_ops
> structures that have this property can be declared as const also.

Patch applied.

Yours,
Linus Walleij
