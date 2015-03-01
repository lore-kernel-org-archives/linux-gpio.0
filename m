From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: Remove non existing GPIO
 pins
Date: Sun, 01 Mar 2015 20:15:54 +0300
Message-ID: <54F3494A.1050604@cogentembedded.com>
References: <1424115661-21928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1424115661-21928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <54EE3782.5040108@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:35580 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751844AbbCARP5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Mar 2015 12:15:57 -0500
Received: by labgm9 with SMTP id gm9so26082040lab.2
        for <linux-gpio@vger.kernel.org>; Sun, 01 Mar 2015 09:15:56 -0800 (PST)
In-Reply-To: <54EE3782.5040108@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-sh@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-gpio@vger.kernel.org

Hello.

On 2/25/2015 11:58 PM, Sergei Shtylyov wrote:

>> GPIO banks 1 and 7 are missing pins 26 to 31. Remove them.

>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>     This patch breaks the boot as well, please don't apply it yet. The same
> about R8A7790 patch. We're thinking about a proper fix...

    Hopefully, such fix has been found and posted. You can now apply this 
series *after* that fix.

WBR, Sergei

