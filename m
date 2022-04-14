Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82ADC433FE
	for <linux-gpio@archiver.kernel.org>; Thu, 14 Apr 2022 08:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240649AbiDNIlS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 14 Apr 2022 04:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbiDNIlR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2022 04:41:17 -0400
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172E664706;
        Thu, 14 Apr 2022 01:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649925521; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=NvD+He9LTHj4iPrpnA0nshq/DhpIAe2/QeIQIih2Va3vqj5AZCXdwggyysDWJF195Jcz4EizJ0tJlP2G/qLtn/OSOeFol1tRye3EDPEcbBboRd/hbQ5Oz8EU9AkZ7Zx8D90l7bB4zg4sYNnBhSd0jP9GhnI6gGMvkdKwNnWUH+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1649925521; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=YYffcehGFoYVVT+n2RAolMjOhDAqqdJAaaNaFG5yQqU=; 
        b=ZLJ4342N5Q9Y4GPwgmzX2YMiWc2c4O8QTVwobaJN0dnZ6YgMJzyq2D9iCFpWqrThViLJp/jgnS9VKSpHVODVB74iI1b9ITvhSK+cHTg4cmlQXMIHRWy3L6UB9Edu8QCnJjPh3ZKE/ueSmZ0SyRWPSohw/E3rBRW4I6gevYm2v/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649925521;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=YYffcehGFoYVVT+n2RAolMjOhDAqqdJAaaNaFG5yQqU=;
        b=J0GqQTvciMcJUvBhIOBR9sw9kTm2fxjym5o68F4guSg+XqOUesLPNJSQXA1Em2VQ
        mn5dZwh+e6q6uOFVmIb56Qv7EU6Dn2/9mfNQSTH8rRtG2hq2pDLYJNzRSLvv6oV3vIV
        KU1B6Tzuem1YRfp35dZtFgBP3vUl8WEUiha9HsdU=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
        with SMTPS id 1649925519751170.1146785751522; Thu, 14 Apr 2022 01:38:39 -0700 (PDT)
Message-ID: <8eb29967-83ca-97c5-d6b9-808cf3ddeb16@arinc9.com>
Date:   Thu, 14 Apr 2022 11:38:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/14] mips: dts: ralink: mt7621: use the new compatible
 string for MT7621 pinctrl
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-10-arinc.unal@arinc9.com>
 <b415523c-34e3-28a1-bcce-4682e7c67e77@linaro.org>
From:   =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <b415523c-34e3-28a1-bcce-4682e7c67e77@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 13/04/2022 18:27, Krzysztof Kozlowski wrote:
> On 13/04/2022 08:07, Arınç ÜNAL wrote:
>> Use the new compatible string "ralink,mt7621-pinctrl" for the Ralink MT7621
>> pinctrl subdriver on mt7621.dtsi.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   arch/mips/boot/dts/ralink/mt7621.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> index 3222684915ac..ee2ec78c8952 100644
>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> @@ -151,7 +151,7 @@ spi0: spi@b00 {
>>   	};
>>   
>>   	pinctrl: pinctrl {
>> -		compatible = "ralink,rt2880-pinmux";
>> +		compatible = "ralink,mt7621-pinctrl";
> 
> The change is non-bisectable and causes issues all other users of DT
> (other projects, systems etc). This is discouraged in general, so you
> should describe it. The commit msg lacks answer to the main question:
> Why? You focused only on what you are doing, but why you are doing is
> actually more important for such change.

As it's seen on any other pinctrl subdriver that calls code from a main 
driver, each subdriver needs to have a different compatible string. We 
don't want the same compatible string to match a different subdriver's 
pinmux data as it's not for our SoC.

I'll add what I typed above to the commit log.

Arınç
