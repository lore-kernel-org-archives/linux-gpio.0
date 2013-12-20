From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [PATCH] gpio: add missing word in gpio dt binding doc
Date: Fri, 20 Dec 2013 09:33:55 +0100
Message-ID: <52B400F3.2020409@overkiz.com>
References: <1387462890-675-1-git-send-email-b.brezillon@overkiz.com> <20131219191315.GP8064@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 9.mo3.mail-out.ovh.net ([87.98.184.141]:52448 "EHLO
	mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752657Ab3LTId6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2013 03:33:58 -0500
Received: from mail408.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 2A397102C06A
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 09:33:57 +0100 (CET)
In-Reply-To: <20131219191315.GP8064@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On 19/12/2013 20:13, Gerhard Sittig wrote:
> On Thu, Dec 19, 2013 at 15:21 +0100, Boris BREZILLON wrote:
>> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio.txt |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
>> index e2295e3..4019ce1 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
>> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
>> @@ -56,7 +56,7 @@ and empty GPIO flags as accepted by the "qe_pio_e" gpio-controller.
>>   2) gpio-controller nodes
>>   ------------------------
>>   
>> -Every GPIO controller node must both an empty "gpio-controller"
>> +Every GPIO controller node must contain both an empty "gpio-controller"
>>   property, and have #gpio-cells contain the size of the gpio-specifier.
>>   
>>   It might contain GPIO hog definitions. GPIO hogging is a mechanism providing
>> -- 
>> 1.7.9.5
> The context of the patch appears to contain stuff that gets
> introduced with the RFC patch you sent out after this one.  If
> this suspicion(sp?) is true, you may have to re-create the patch
> on top of something official.

Ooops. Your suspicions were true ;-).
I'll send a new patch based on a clean context.

Best Regards,

Boris
> :)  And you may want to mark this
> patch as "trivial".
>
>
> virtually yours
> Gerhard Sittig

