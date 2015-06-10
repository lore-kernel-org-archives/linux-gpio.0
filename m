From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 0/4] sh-pfc: handle pin array holes in sh_pfc_map_pins()
Date: Wed, 10 Jun 2015 15:11:50 +0300
Message-ID: <55782986.7040208@cogentembedded.com>
References: <4326653.qPvIJDU6F2@wasted.cogentembedded.com> <CACRpkdYXHbP0jhvNxojhh=Mr-NCe-ismBp7g5T5_vYLFDz9rtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:36799 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933222AbbFJMLx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 08:11:53 -0400
Received: by lbbqq2 with SMTP id qq2so27484929lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 05:11:51 -0700 (PDT)
In-Reply-To: <CACRpkdYXHbP0jhvNxojhh=Mr-NCe-ismBp7g5T5_vYLFDz9rtw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello.

On 6/10/2015 10:49 AM, Linus Walleij wrote:

>>     Here's the set of 4 patches against the 'devel' branch of Linus Walleij's
>> 'linux-pinctrl.git' repo. Here we add proper handling of the pin array "holes"
>> and then remove unused GPIO pins for R8A7790/1 SoCs.

>> [1/4] sh-pfc: do not call sh_pfc_get_pin_index() when unnecessary
>> [2/4] sh-pfc: handle pin array holes
>> [3/4] sh-pfc: r8a7790 remove non-existing GPIO pins
>> [4/4] sh-pfc: r8a7791 remove non-existing GPIO pins

> Waiting for Laurent to review this series.

    Me too. :-)
    Note that the last 2 patches are Laurent's.

> Yours,
> Linus Walleij

WBR, Sergei

