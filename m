From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH v5 2/2] USB: serial: cp210x: Adding GE Healthcare Device
 ID
Date: Thu, 7 Apr 2016 11:04:04 +0100
Message-ID: <57063094.5020708@collabora.co.uk>
References: <cover.1459269397.git.martyn.welch@collabora.co.uk>
 <ddee21e702ef47d8c97d6fa3b37acbb8be28634e.1459269397.git.martyn.welch@collabora.co.uk>
 <20160407093952.GF25008@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33669 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751240AbcDGKEI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Apr 2016 06:04:08 -0400
In-Reply-To: <20160407093952.GF25008@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org



On 07/04/16 10:39, Johan Hovold wrote:
> On Tue, Mar 29, 2016 at 05:47:29PM +0100, Martyn Welch wrote:
>> The CP2105 is used in the GE Healthcare Remote Alarm Box, with the
>> Manufacturer ID of 0x1901 and Product ID of 0x0194.
>>
>> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
>> ---
>>   drivers/usb/serial/cp210x.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
>> index b1eb8da..5b5c4ec 100644
>> --- a/drivers/usb/serial/cp210x.c
>> +++ b/drivers/usb/serial/cp210x.c
>> @@ -170,6 +170,7 @@ static const struct usb_device_id id_table[] = {
>>   	{ USB_DEVICE(0x1843, 0x0200) }, /* Vaisala USB Instrument Cable */
>>   	{ USB_DEVICE(0x18EF, 0xE00F) }, /* ELV USB-I2C-Interface */
>>   	{ USB_DEVICE(0x18EF, 0xE025) }, /* ELV Marble Sound Board 1 */
>> +	{ USB_DEVICE(0x1901, 0x0194) },	/* GE Healthcare Remote Alarm Box */
>>   	{ USB_DEVICE(0x1ADB, 0x0001) }, /* Schweitzer Engineering C662 Cable */
>>   	{ USB_DEVICE(0x1B1C, 0x1C00) }, /* Corsair USB Dongle */
>>   	{ USB_DEVICE(0x1BA4, 0x0002) },	/* Silicon Labs 358x factory default */
>
> This one does not apply, what tree did you generate it against against?
>
> I can fix it up here, but it makes me worried about the (unrelated)
> first gpio patch as well.

FWIW, I've just rebased onto the latest commit of usb-next and retested 
the other GPIO patch. It's working as expected.

Martyn

> Thanks,
> Johan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
