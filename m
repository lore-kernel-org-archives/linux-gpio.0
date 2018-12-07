From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sx150x: handle failure case of devm_kstrdup
Date: Fri, 7 Dec 2018 13:23:28 +0100
Message-ID: <CACRpkdYB9i5fy9KyBBsqoh4Mh6RgtOx15mTHd_cmT=nHS=f0Dw@mail.gmail.com>
References: <1543745057-31616-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543745057-31616-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Dec 2, 2018 at 11:08 AM Nicholas Mc Guire <hofrat@osadl.org> wrote:

> devm_kstrdup() may return NULL if internal allocation failed.
> Thus using  label, name  is unsafe without checking. Therefor
> in the unlikely case of allocation failure, sx150x_probe() simply
> returns -ENOMEM.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: 9e80f9064e73 ("pinctrl: Add SX150X GPIO Extender Pinctrl Driver")

Patch applied.

> Problem located with an experimental coccinelle script

I like this script.

Yours,
Linus Walleij
