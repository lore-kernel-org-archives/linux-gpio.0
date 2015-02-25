From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: Remove non existing GPIO
 pins
Date: Wed, 25 Feb 2015 23:58:42 +0300
Message-ID: <54EE3782.5040108@cogentembedded.com>
References: <1424115661-21928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1424115661-21928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:40640 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753370AbbBYU6r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Feb 2015 15:58:47 -0500
Received: by lbdu10 with SMTP id u10so6637492lbd.7
        for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2015 12:58:45 -0800 (PST)
In-Reply-To: <1424115661-21928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-sh@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-gpio@vger.kernel.org

On 02/16/2015 10:41 PM, Laurent Pinchart wrote:

> GPIO banks 1 and 7 are missing pins 26 to 31. Remove them.

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

    This patch breaks the boot as well, please don't apply it yet. The same 
about R8A7790 patch. We're thinking about a proper fix...

WBR, Sergei

