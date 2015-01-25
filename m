From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 3/3] gpio: sysfs: fix gpio attribute-creation race
Date: Sun, 25 Jan 2015 18:33:48 +0900
Message-ID: <CAAVeFuLNZuM9V+pd4HNLcfh0Levd6a5bJUOm2yKBG8YXD8h+TQ@mail.gmail.com>
References: <1421150406-20255-1-git-send-email-johan@kernel.org> <1421150406-20255-4-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:42022 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751642AbbAYJeK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Jan 2015 04:34:10 -0500
In-Reply-To: <1421150406-20255-4-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jan 13, 2015 at 9:00 PM, Johan Hovold <johan@kernel.org> wrote:
> Fix attribute-creation race with userspace by using the default group
> to create also the contingent gpio device attributes.
>
> Fixes: d8f388d8dc8d ("gpio: sysfs interface")
> Signed-off-by: Johan Hovold <johan@kernel.org>

Same, this one does not apply to Linus' devel branch. :( Too bad
because there seems to be good stuff in here.
