From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] pinctrl: stm32: constify gpio_chip structures
Date: Tue, 13 Sep 2016 10:38:17 +0200
Message-ID: <CACRpkdZpt3R5NU-mgd3BzrwJaiB_xyLqcxruR=6RHihRGm7iKA@mail.gmail.com>
References: <1473596082-32690-1-git-send-email-Julia.Lawall@lip6.fr> <1473596082-32690-5-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1473596082-32690-5-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Sep 11, 2016 at 2:14 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> These structures are only used to copy into other structures, so declare
> them as const.
(...)
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied, after some fuzzing.

Yours,
Linus Walleij
