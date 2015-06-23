From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 1/4] sh-pfc: do not call sh_pfc_get_pin_index() when
 unnecessary
Date: Tue, 23 Jun 2015 23:00:13 +0300
Message-ID: <5589BACD.9080205@cogentembedded.com>
References: <4326653.qPvIJDU6F2@wasted.cogentembedded.com> <10321666.EILxzFPKZf@wasted.cogentembedded.com> <1860613.5T71vLz0D7@avalon> <55888F61.800@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:33274 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754766AbbFWUAS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2015 16:00:18 -0400
Received: by lbbvz5 with SMTP id vz5so13606230lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2015 13:00:16 -0700 (PDT)
In-Reply-To: <55888F61.800@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linus.walleij@linaro.org, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org

Hello.

On 06/23/2015 01:42 AM, Sergei Shtylyov wrote:

>>> Calling sh_pfc_get_pin_index()  to calculate a pin index based on the
>>> collected pin range data is unnecessary when we're dealing with
>>> 'pfc->info->pins' and 'chip->pins' arrays as those always reperesent the
>>> pins starting from index 0 sequentially. Being a  mere  optimization at
>>> this time, this change will become crucial when we'll allow the "holes" in
>>> those arrays...

>> Pin information is stored in per-SoC pins arrays (a.k.a. pfc->info->pins). The
>> driver support two models to number pins:

>> - The sequential model, in which pins are numbered sequentially starting at 0.
>> Pin numbers are equal to the index in the array.

>     And I didn't touch this case.

>> - The explicit numbering model, in which each pin entry has an explicit number
>> (stored in struct sh_pfc_pin.pin). Pins numbers are not necessarily equal to
>> the index of the pin entry in the array.

>     Ah... I was just looking at _GP_GPIO() which still assigns sequential pin
> #'s equal to the indices.

    And forgot about SH_PFC_PIN_NAMED()...

>> The sh_pfc_get_pin_index() function converts a pin number to the pin index in
>> the pins array.

>> Let's consider the sh_pfc_pinconf_validate() from which your patch removes the
>> call to sh_pfc_get_pin_index() and uses the pin number directly. The function
>> is called from the .pin_config_get() and .pin_config_set() handlers. One
>> possible call path is

>> pinconf_pins_show() -> pinconf_dump_pin() -> pinconf_dump_pins() ->
>> pinconf_generic_dump_pins() -> pinconf_generic_dump_one() ->
>> pin_config_get_for_pin() -> .pin_config_get()

>> The pin value passed to the .pin_config_get() function is pctldev->desc->
>> pins[i].number, which is the pin number, not its index. It thus looks like
>> this patch introduces a bug.

>> There might be something obvious I'm not getting though, so please feel free
>> to prove me wrong.

>     The bug seems more like theoretical one at this point (unless you have the
> examples with non-sequential pin #'s)...

    No, with non-GPIO pins it seems to be an actual bug.

    What if we remove the explicit array index from _GP_GPIO() and so don't 
have the holes at all?

WBR, Sergei

