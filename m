Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992574;
	b=ju2HNRHH18nCjY4/uEByn+rZX83ieOIflDs50Vq1QRXVlg95PGeTwvImnXSQQSsP0cae
	 dTHYOkF80KndowM82eETznuqCzAD1FYrfOLcZNLtdtTZ7ez72/0VxbyPvD5nSHO3TXGey
	 CaVgV+Az7bjmflJzgvBVfDuoJMSP0/IVJAhiMwcr3WfpJz/HaJWQ26kHVcef9FBj+tgE8
	 DD+HtRfwyMzLTPzjTfBR7I7NwZmrdkUDQcV4zZkhIb3TTVzDnksykcNJs2WrD3rKEUMXO
	 cTJkqDODnAru5d/0ifZq3sYOmBAmUn0SUSaNiJvOVtbBU4w9rkL22p3UY+w3SlrYwIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=;
	b=byLfXapmNTJmtotbq+57NL7oX3gszpf6qXdT7wG5f1AJzle70gAvVyv5NxiqHwPC9hGu
	 49LZDQSVpdN2OELxJJhk3PXP3E1vbF0BiRVXzjtnqjNaEGrYzG52i8hdfo0Han168Pd5k
	 Lwc4hTk2rmpuaAuyt46smQZHCPQucDX8fe5bstCNOPKX7e3JQ4t5vNFh72hO8IXtjwRuf
	 B1cm53+rjb87/8e59wn7bhp/d6wyMpcMFDCTPdyb53LKTYUMfC+Md2UdMwkzxyGZlLnL0
	 i8J2/sEGhoPf1OvxV45/ax7VNs0iEXe0FRuMNCdcMKHoLxnc/E4dhdK9RyfckpqpibQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFYcflQW;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACA606A320
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 09:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59ACA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFYcflQW
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso265432f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 01:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992573; x=1795597373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=;
        b=jFYcflQWi0KiGrvAIrYwGd0IhxRJsPZaaz0xMt0Zg88+3smh1NaWOYEDbv6YuGSxnT
         JBqpzr3592IXDkwMsdm0IDibtktBVlN1pHF604H5IbgcU9RFWs1KmGdflNSHOmoccLo9
         C5+PQPqerTi+/ZHrdYmwmOZuLcQ7LkO9fgKwS65K/KqMFDX+8Ez+Hb0RXIeqlFHUMQ4L
         8vyrO5DUFI/1hYqZMYJQn1/qmbzub/uxWScRYUIuI8n3VBTQM3ptlBgP3dFzyF4SfChM
         lsNJ++M5AX83DtWAmMjT6QJwSMWm9NNdgxS+7Zn0lMRhjhq1phaKPSzG5OKJlvOKTM+N
         KgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992573; x=1795597373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=;
        b=Z/R4o6aB3Q2trDg/1DyMOTNJyxMpiGke9YJUUBXq2ZEvwQYpytAuHsZNlP0+kkO3co
         aHLkvDO3/zEJwzQpq0a6fZye27ucFW4mfgjCYHGK1BgrgG0vTqoUAplHqDbPbhEiU+0Z
         zrqlWRhsksxv1ipe4UkqPaucKI6PjfND2a9p1AaeltB7ts9fnvMlqUXXGc7r52MG7RUn
         up9dRF4sRzkaJwuXe/nSnh/TcwRUTplz0oj7lsEtMxT8YCT6U0bCrymPG85ZaT8b9oAk
         cCqKRm3iDAw//UkzkUIiYvvepWveY0CNeFywV9W3tQl9xWtpemTcnN9OEcqwXxAb306J
         thLw==
X-Forwarded-Encrypted: i=1; AL+hErFeZF6jPAEsdgF94dRwJEcEiMCS9iyzvKcYPCC6DJtDRFjgXv/iW/1SHrzPFOc8XzJNo5br6/28T108@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZBW3gQIppeJoJ5REww7z6kW9V07jYrcX9QLM2+c9tAaQSZ8Q+
	1BQgy2Z3A3GYrV3wrSDYdJI4v6QsiX1NIo5orFPmHpJ6Glk7cibBW9Vr
X-Gm-Gg: AZFdTZd7KCnDCPx8lLWERJSYwDrbYvCPAKQZlrNWWC78lbu2c6lKR9gVaXU/mxnAbaZ
	k+DHH+wA74LDbJ9nw9l8HL/IAiWvdKuW6I8uQG4sQ3GID9QGc34lsUFBtrhn+S4dZvljCxjK0YS
	SzfU2aKK9ZwBRj+6AbV+FfBUA8zyA3TLcpZ6k0cZ68pPOEq1wY95q3+9tvqi4odSnWFsGp5ID07
	dKFFxjFUNgB3IASt7jKopOc+t/l2eIfFhbkFp0Px7Ms0JriFRWPvWLtbatIyqdnvaKF7YEqWdc6
	Z9ZEHYPjjZRKR0sPgxu7jWe1HnqCuwlIxInZw+slrDrMWfgQcakEjz4lhDTYN4xvRytViwmPGc3
	exOUIvumBQbHDo/Ckip0Q3Jd+OYVFKFiDukr+IqHwgaN4HdCY93L7KyXO/ENTLA41mYRsr+L45C
	WeIhrGERNN8bmxKWUSBDMRufnfbIG3azf2g99mTlIoZyJ9N6ip+Sedg5dhIwMU6E06moknESfWm
	5tIWw8NLe53RC+VsUPqYZD1MnPgbg3Ou/MQabvSMCT5s8eTrrvwZNQYL0mGBoBcFFW5KKUxSsbC
	fSZSyWu6PnXmoS7nSXbf71AKzL3nJcnfRapdo8kQRAv1lm6t4CFHx38an6U7r8WvdQ==
X-Received: by 2002:a05:6000:4812:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4a63b9d9635mr3815055f8f.22.1794992572498;
        Wed, 18 Nov 2026 01:02:52 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm3475452f8f.18.2026.11.18.01.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:02:51 -0800 (PST)
Date: Wed, 18 Nov 2026 09:02:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL
 terminated
Message-ID: <20261118090250.2ae9258f@pumpkin>
In-Reply-To: <85ff5be0-4fad-4d92-b9f3-2553c7c4365b@amd.com>
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
	<20261117131616.0a631d5c@pumpkin>
	<85ff5be0-4fad-4d92-b9f3-2553c7c4365b@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 14:08:16 +0530
Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:

> Hi David,
> 
> On 11/17/2026 6:46 PM, David Laight wrote:
> > On Tue, 17 Nov 2026 13:09:47 +0530
> > Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:
> >   
> >> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
> >> 16-byte field and does not guarantee NUL termination. A 16-character
> >> name fills the entire field.
> >> The driver copies this field into a 16-byte buffer and subsequently
> >> uses it as a C string. For a non-NUL-terminated name, string operations
> >> can read past the end of the buffer into the adjacent groups pointer.
> >>
> >> Reserve an extra byte for the NUL terminator and explicitly terminate
> >> the copied function name.
> >>
> >> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> >> ---
> >>   drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
> >>   1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> >> index aba129ead04c..c778133fadc2 100644
> >> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> >> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> >> @@ -29,7 +29,11 @@
> >>   
> >>   #define ZYNQMP_PIN_PREFIX			"MIO"
> >>   #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
> >> -#define MAX_FUNC_NAME_LEN			16
> >> +/*
> >> + * Firmware returns the name in a fixed-size field and does not guarantee a
> >> + * NUL terminator. Keep one extra byte for the NUL terminator.
> >> + */
> >> +#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
> >>   #define MAX_GROUP_PIN				50
> >>   #define MAX_PIN_GROUPS				50
> >>   #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
> >> @@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
> >>   	 */
> >>   	zynqmp_pm_query_data(qdata, payload);
> >>   	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
> >> +	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';  
> > 
> > Too many constants....
> > You might want to try embedding 'name' in a structure.
> > 
> > Then, at least, you can use sizeof().  
> Ok, i will define the below structure
> 
> struct zynqmp_func_name {
>         char name[ZYNQMP_FUNC_NAME_LEN];
>         char nul;
> };

I'd try getting rid of NAME_LEN and just define the array as size
RESP_LEN + 1.

David

> 
> and initialize them as below.
> 
> memcpy(fname->name, payload, sizeof(fname->name));
> fname->nul = '\0';
> 
> Regards
> Sai Krishna
> 
> > 
> > David
> > 
> >   
> >>   }
> >>   
> >>   static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)  
> >   
> 

