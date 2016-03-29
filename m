From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] gpio: pca953x: Use correct u16 value for register word
 write
Date: Wed, 30 Mar 2016 00:33:28 +0800
Message-ID: <56FAAE58.20004@electromag.com.au>
References: <1459232852-15697-1-git-send-email-sdliyong@gmail.com>
 <56FA6FB6.4040003@electromag.com.au>
 <CADO9-pdhTOmg9OMgz+K++Gc3mCxbi7KF23kA8zsftVeDTR3SSw@mail.gmail.com>
 <1680089.6CCf2RWg8O@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:42810 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752755AbcC2Qde (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2016 12:33:34 -0400
In-Reply-To: <1680089.6CCf2RWg8O@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>, linux-kernel@vger.kernel.org
Cc: Yong Li <sdliyong@gmail.com>, linux-gpio@vger.kernel.org

On 29/03/2016 10:39 PM, Alexander Stein wrote:
> You missed CC'ing Phil (Added for this post)
>
> On Tuesday 29 March 2016 20:53:58, Yong Li wrote:
>> Thanks for your comment, I think I can change it to val[0] | (val[1]
>> << 8), is it okay ?
>
> Mh, currently there is only one caller (device_pca953x_init) which passes only
> 0, 0 or 0xff, 0xff, so endianess is irrelevant. But to be future proof this
> should be done in an endian-safe manner. Though cpu_to_le16p does not work,
> due to same alignment problem as casting to u16*.
>

I think get_unaligned((u16 *) val) should do the job.
There's also get_unaligned_le* get_unaligned_be*

-- 
Regards
Phil Reid

