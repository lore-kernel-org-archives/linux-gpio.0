From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v5 2/2] USB: serial: cp210x: Adding GE Healthcare Device
 ID
Date: Thu, 7 Apr 2016 10:45:10 +0100
Message-ID: <57062C26.5080301@collabora.co.uk>
References: <cover.1459269397.git.martyn.welch@collabora.co.uk>
 <ddee21e702ef47d8c97d6fa3b37acbb8be28634e.1459269397.git.martyn.welch@collabora.co.uk>
 <20160407093952.GF25008@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160407093952.GF25008@localhost>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org



On 07/04/16 10:39, Johan Hovold wrote:
> On Tue, Mar 29, 2016 at 05:47:29PM +0100, Martyn Welch wrote:
>> The CP2105 is used in the GE Healthcare Remote Alarm Box, with the
>> Manufacturer ID of 0x1901 and Product ID of 0x0194.
>>
>> Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
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

The usb-next branch of 
git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git as 
per your email of 31/01/16.

Martyn

> I can fix it up here, but it makes me worried about the (unrelated)
> first gpio patch as well.
>
> Thanks,
> Johan
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
