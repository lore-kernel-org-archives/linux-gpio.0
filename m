From: "David.Wu" <wdc@rock-chips.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: rockchip-pinctrl: Support the RK3399
 SoCs compatible
Date: Mon, 1 Feb 2016 10:35:30 +0800
Message-ID: <56AEC472.9030909@rock-chips.com>
References: <1451997055-47655-1-git-send-email-wdc@rock-chips.com>
 <1454153517-52969-1-git-send-email-david.wu@rock-chips.com>
 <1454153517-52969-3-git-send-email-david.wu@rock-chips.com>
 <14543443.RsRWh5K5Uv@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:37002 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469AbcBACfb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Jan 2016 21:35:31 -0500
In-Reply-To: <14543443.RsRWh5K5Uv@phil>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, David Wu <david.wu@rock-chips.com>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Heiko,

=E5=9C=A8 2016/1/30 20:16, Heiko Stuebner =E5=86=99=E9=81=93:
> Hi David,
>
> Am Samstag, 30. Januar 2016, 19:31:57 schrieb David Wu:
>> Change-Id: Ic1bdb3dc358837e97d7b48dd58be2f8d9d08d766
> please no Change-Id, it's missing the Signed-off, and as Linus Wallei=
j said,
> the compatible addition to the documentation can maybe stay in the pi=
nctrl-
> patch itself.
>
> I think both Linus and me overlooked that the binding-doc-addition wa=
s
> already correctly included in your v2 patch at the top :-)
>

Okay, I will merge it in one patch. sorry for my misunderstand.


> Heiko
>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 1=
 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>> b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt ind=
ex
>> 391ef4b..3bb9456 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>> @@ -22,6 +22,7 @@ Required properties for iomux controller:
>>     - compatible: one of "rockchip,rk2928-pinctrl",
>> "rockchip,rk3066a-pinctrl" "rockchip,rk3066b-pinctrl",
>> "rockchip,rk3188-pinctrl"
>>   		       "rockchip,rk3288-pinctrl", "rockchip,rk3368-pinctrl"
>> +		       "rockchip,rk3399-pinctrl"
>>     - rockchip,grf: phandle referencing a syscon providing the
>>   	 "general register files"
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
