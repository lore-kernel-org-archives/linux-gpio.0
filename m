From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3] pinctrl: sh-pfc: r8a7794: add VIN pin groups
Date: Tue, 22 Sep 2015 01:02:57 +0300
Message-ID: <56007E91.8010408@cogentembedded.com>
References: <13219129.kD4pZSmcAP@wasted.cogentembedded.com>
 <2210950.JhIO20W3xN@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:33808 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753345AbbIUWDA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 18:03:00 -0400
Received: by lahg1 with SMTP id g1so77684408lah.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 15:02:58 -0700 (PDT)
In-Reply-To: <2210950.JhIO20W3xN@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-sh@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org

On 09/22/2015 12:59 AM, Sergei Shtylyov wrote:

> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Add VIN0/1 pin groups to R8A7794 PFC driver.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [Sergei: rebased, renamed, added changelog, gathered 12 VIN1 data pins into a
> single pin group, added "vin1_data10" pin group.]
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> Changes in version 3:
> - added "vin1_data10" pin group.

    Sorry, posted from a wrong file. The patch itself was OK though.

MBR, Sergei

