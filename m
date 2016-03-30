From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] gpio: pca953x: Use correct u16 value for register word
 write
Date: Wed, 30 Mar 2016 13:14:52 +0800
Message-ID: <56FB60CC.9000605@electromag.com.au>
References: <1459232852-15697-1-git-send-email-sdliyong@gmail.com>
 <56FA6FB6.4040003@electromag.com.au>
 <CADO9-pdhTOmg9OMgz+K++Gc3mCxbi7KF23kA8zsftVeDTR3SSw@mail.gmail.com>
 <1680089.6CCf2RWg8O@ws-stein> <56FAAE58.20004@electromag.com.au>
 <CADO9-pdxpQRQQ8RFtjT6rz28GteL3u+at0EGVdNwG8VV48SGEw@mail.gmail.com>
 <CADO9-pfuBVA1HW+XrV5oN_6jF2mebi3QeTiro1B8DCk+Em2Yug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:60943 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751227AbcC3FO7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2016 01:14:59 -0400
In-Reply-To: <CADO9-pfuBVA1HW+XrV5oN_6jF2mebi3QeTiro1B8DCk+Em2Yug@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On 30/03/2016 1:01 PM, Yong Li wrote:
> Or another method is using the below to convert the u8 to u16:
> cpu_to_le16(get_unaligned((u16 *) val)), compared with the
> i2c_smbus_write_byte_data method, which one is better?
>
>

G'day Yong,

I'd go with the cpu_to_le16(get_unaligned((u16 *) val))



-- 
Regards
Phil Reid

