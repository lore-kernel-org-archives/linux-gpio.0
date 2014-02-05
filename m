From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bcm281xx: Update MODULE_AUTHOR
Date: Wed, 5 Feb 2014 11:03:32 +0100
Message-ID: <CACRpkda=h=0bpMfHeq-zJs5nZ+740rz9jZChCk0OAHm=Jmw5AQ@mail.gmail.com>
References: <1391463780-19840-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391463780-19840-1-git-send-email-markus.mayer@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 3, 2014 at 10:43 PM, Markus Mayer <markus.mayer@linaro.org> wrote:

> Add Broadcom's upstreaming mailing list address to MODULE_AUTHOR.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>

Hm OK not that this is used very much, and nothing to argue about
so patch applied.

However we do not really recognize corporate bodies as maintainers,
only physical people whose GPG keys we can sign ... but I
guess you wanted to convey that the driver is the work of several
individuals inside BRCM and thus authors, while you take care
of the maintenance.

A patch to MAINTAINERS adding this to Christians entry for
the SoCs or as a standalone entry with Markus as maintainer
would be more important and usefule than this though, so I'm
throwing out that challenge!

Yours,
Linus Walleij
