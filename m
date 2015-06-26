From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 0/3] Remove non-existing GPIO pins for R8A7790/1
Date: Fri, 26 Jun 2015 23:51:17 +0300
Message-ID: <558DBB45.3020507@cogentembedded.com>
References: <1460630.GxHT4lRd7u@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:36673 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752036AbbFZUvW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2015 16:51:22 -0400
Received: by lbbpo10 with SMTP id po10so71308333lbb.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2015 13:51:20 -0700 (PDT)
In-Reply-To: <1460630.GxHT4lRd7u@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-sh@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org

On 06/26/2015 01:39 AM, Sergei Shtylyov wrote:

>     Here's the set of 3 patches against the 'fixes' branch of Linus Walleij's
> 'linux-pinctrl.git' repo. Here we eliminate the pin array "holes" on R-Car SoCs
> and then remove unused GPIO pins for R8A7790/1.

> [1/3] sh-pfc: fix sparse GPIOs for R-Car SoCs

    Note that this patch is necessary for the R8A7794 driver (already in 
Linus' tree to work correctly.

WBR, Sergei

