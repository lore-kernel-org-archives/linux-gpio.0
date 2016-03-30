From: Yong Li <sdliyong@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Use correct u16 value for register word write
Date: Wed, 30 Mar 2016 13:01:17 +0800
Message-ID: <CADO9-pfuBVA1HW+XrV5oN_6jF2mebi3QeTiro1B8DCk+Em2Yug@mail.gmail.com>
References: <1459232852-15697-1-git-send-email-sdliyong@gmail.com>
 <56FA6FB6.4040003@electromag.com.au> <CADO9-pdhTOmg9OMgz+K++Gc3mCxbi7KF23kA8zsftVeDTR3SSw@mail.gmail.com>
 <1680089.6CCf2RWg8O@ws-stein> <56FAAE58.20004@electromag.com.au> <CADO9-pdxpQRQQ8RFtjT6rz28GteL3u+at0EGVdNwG8VV48SGEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:34590 "EHLO
	mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210AbcC3FBh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2016 01:01:37 -0400
In-Reply-To: <CADO9-pdxpQRQQ8RFtjT6rz28GteL3u+at0EGVdNwG8VV48SGEw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Or another method is using the below to convert the u8 to u16:
cpu_to_le16(get_unaligned((u16 *) val)), compared with the
i2c_smbus_write_byte_data method, which one is better?

Thanks,
Yong

2016-03-30 10:43 GMT+08:00 Yong Li <sdliyong@gmail.com>:
> If use the get_unaligned, below is the code example, but we cannot detect if
> it is big endian or little endian. I would like to use the same write logic
> as PCA957X_TYPE: use the i2c_smbus_write_byte_data API to write two times.
> How do you think about it?
>
> if (big_endian)
> value = get_unaligned_be16(buf);
> else
> value = get_unaligned_le16(buf);
>
> Thanks,
> Yong Li
> 2016-03-30 0:33 GMT+08:00 Phil Reid <preid@electromag.com.au>:
>>
>> On 29/03/2016 10:39 PM, Alexander Stein wrote:
>>>
>>> You missed CC'ing Phil (Added for this post)
>>>
>>> On Tuesday 29 March 2016 20:53:58, Yong Li wrote:
>>>>
>>>> Thanks for your comment, I think I can change it to val[0] | (val[1]
>>>> << 8), is it okay ?
>>>
>>>
>>> Mh, currently there is only one caller (device_pca953x_init) which passes
>>> only
>>> 0, 0 or 0xff, 0xff, so endianess is irrelevant. But to be future proof
>>> this
>>> should be done in an endian-safe manner. Though cpu_to_le16p does not
>>> work,
>>> due to same alignment problem as casting to u16*.
>>>
>>
>> I think get_unaligned((u16 *) val) should do the job.
>> There's also get_unaligned_le* get_unaligned_be*
>>
>> --
>> Regards
>> Phil Reid
>>
