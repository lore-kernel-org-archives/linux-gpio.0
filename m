From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: remove unneeded assignation
Date: Mon, 13 Jul 2015 23:20:13 +0900
Message-ID: <CAAVeFuJ8UKwf9G9r8jONcgpdpRSCaMqXR7wtQniLgmVbUm-nEA@mail.gmail.com>
References: <1436300535-1230-1-git-send-email-laurent.navet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436300535-1230-1-git-send-email-laurent.navet@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Navet <laurent.navet@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2015 at 5:22 AM, Laurent Navet <laurent.navet@gmail.com> wrote:
> ret is assigned value from of_property_read_string_index but is
> overwritten before being used so remove it.
> Also fix coverity CID 1309759

You should probably have a line that says

Reported-by: coverity (CID 1309759)

As other similar patches do.
