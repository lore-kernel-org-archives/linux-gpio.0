From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 4/4] pinctrl: sh-pfc: Use u32 to store register addresses
Date: Thu, 12 Mar 2015 03:02:51 +0200
Message-ID: <3725535.iu1CkyQgCh@avalon>
References: <1425985583-26279-1-git-send-email-geert+renesas@glider.be> <1425985583-26279-5-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39605 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133AbbCLBCt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 21:02:49 -0400
In-Reply-To: <1425985583-26279-5-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tuesday 10 March 2015 12:06:23 Geert Uytterhoeven wrote:
> Currently all PFC registers lie in low 32-bit address space. Hence use
> u32 instead of unsigned long to store PFC register addresses in pinctrl
> tables.  All calculations of virtual addresses use a phys_addr_t
> intermediate, so we know where to add an offset if the 32-bit assumption
> ever becomes false.
> 
> While this doesn't impact 32-bit builds, it would save ca. 7 KiB on a
> 64-bit shmobile_defconfig kernel.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

