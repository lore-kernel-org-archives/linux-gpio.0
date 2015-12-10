From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: pxa: convert to devm_ioremap
Date: Thu, 10 Dec 2015 16:05:18 +0100
Message-ID: <CACRpkdYFzZm2s5Auc8eeKEPTyF5_kaW3fWUKsR2mSUiiTuHARQ@mail.gmail.com>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<1448746665-13422-3-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448746665-13422-3-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 28, 2015 at 10:37 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Use the device managed ioremap to simplify the probe function.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Patch applied.

Yours,
Linus Walleij
