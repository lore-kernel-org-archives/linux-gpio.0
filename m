From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7794: add USB pin groups
Date: Thu, 20 Aug 2015 22:48:17 +0300
Message-ID: <55D62F01.1000105@cogentembedded.com>
References: <13219129.kD4pZSmcAP@wasted.cogentembedded.com>
 <3312528.qhxUnkrByY@avalon> <55D5CF42.9080802@cogentembedded.com>
 <1984971.qNkUb8XJq2@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:35665 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751895AbbHTTsV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2015 15:48:21 -0400
Received: by lbcbn3 with SMTP id bn3so30579909lbc.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2015 12:48:20 -0700 (PDT)
In-Reply-To: <1984971.qNkUb8XJq2@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linus.walleij@linaro.org, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

On 08/20/2015 10:44 PM, Laurent Pinchart wrote:

>>> Thank you for the patch.
>>
>> My pleasure. :-)
>>
>>> On Wednesday 19 August 2015 01:26:55 Sergei Shtylyov wrote:
>>>> From: Shinobu Uehara <shinobu.uehara.xc@renesas.com>
>>>>
>>>> Add USB0/1 pin groups to R8A7794 PFC driver.
>>>>
>>>> Signed-off-by: Shinobu Uehara <shinobu.uehara.xc@renesas.com>
>>>> [Sergei: rebased, renamed, added changelog.]
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Thank you!
>> How about the VIN patch? :-)
>
> I was hoping someone else would review that one :-)  Geert, would you have a
> bit of bandwidth to spare ?

   The MAINTAINERS file still has you as the Renesas PFC maintainer not Geert. ;-)

MBR, Sergei

