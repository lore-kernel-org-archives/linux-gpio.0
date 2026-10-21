Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605191;
	b=kWOPZJQBqXoUdjFdXbx/kK9q4noGngA1TatvHaEHA2jjHt+BrXxVwekDgbtoS3bqC1xJ
	 UXI/WZHolWmvoKjUZ8GbsNFwqMCjHreWdlJHmDShjCE9TEb8gb96T9j5pMxHMrCK4hBG6
	 TtzHFy8lxsXz3ttWkXCcpKBrx0I1MQj4aKFk1Ym7kjE3+6DkCPGWHlMjDbvgz0AXiY7sQ
	 TwDS8K/E3N6Vy9a6atx6JEF0c2fjGmPbjJxVm3c51Bvv9rYZkswlIs/tVq+VL7pUkjb5E
	 RnABsg2JI4BmoBDn0djxPwe/aBzo+YEnHXJgDccyEGqNgjodKCfbc8nZ2HUC/WMQQLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=weV/t3lpY+C1wlkMGy3iusRIaCsEICQ6LvTEtzN/MEM=;
	b=iFFaatgsPaT0zdUaKj+PpMIQYaGuZg9yfUvqacBuQFS6pxZp+i27IFoI1vhCkkGIC4L8
	 Oyy35Wkjh004sfWaJXLSszalFkRc3Ls+xo2Co6twW2THLS5+PQaCD8tql69hW1I0byt8W
	 BucuXbdT4VV0nSCuD4yBhqbSKXQqz865+nAO+KY2MCb7RiTnceayhFQ87h5c/YuF4voDA
	 HIdA7fec6vmL3tZ9usnIydZ+D6ZjF3BF93t1CuuE723gZZqiJ6JJFU/BcXOb3Xt2+5J5E
	 0wULprPrKqi8M+tFPaw/8CLEPfw2rzORc3+m/Kv/FCLgk0mcqHUsx35lIQmcO94m5ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OPWzM0l8;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42B606A319
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 17:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD42B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OPWzM0l8
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1052418c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605190; x=1793209990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weV/t3lpY+C1wlkMGy3iusRIaCsEICQ6LvTEtzN/MEM=;
        b=OPWzM0l8ptIfPVIvgbXuCW6EegEHiRBkVWJ2jiXv+CgDRuQWgxn4j8B34jOF3TbI00
         SsId14XwxZB/ca92qNcQDYAqwu0aYF+FICOSbdu+3UNLzb1l7WgSQ8TNxY+7hYqRNEhx
         ZlzCoIy68vjLJIR5HWsSYMptL6AQ05M62VP3VWTT/sQ8hhFGxWm46BSY63vo0xMor5L1
         oD9Tf2rTMd0U/iF/5kOg433PbgJj8JsrrQs5b08rEukFFnreMPj61Ryk+ztvCbHtTxVk
         UR/n1DDwNmGIfHlpAJyCkU+BFwCqC3yPe2zpJgiFympa8X1dVa8pMfSEh6m+mWbQxXYP
         KRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605190; x=1793209990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weV/t3lpY+C1wlkMGy3iusRIaCsEICQ6LvTEtzN/MEM=;
        b=oIfCt9dduNnpBviLGdGHEwCEkKcX7alnp490OWMHtX5KI0If6VVn29hNcvVraeWfEf
         Qwr0RMxOkyqSlk5aF1zhq29kxKFs0TDFjJctRnjOVFsRmgBqWBRFBl0y3ocgap1krHgh
         A6mC5d+MiG98ur60o82Mc+PcIzC06PdsvCWdR1Lp/rijqIgKqD5RxbGyo+/mfSNrcq6b
         TU5daMNy85viViZEptkL2aosesLFtvIvMWIFal3NVYoDXgL8XMwMg3N9+k5Gfk1goYLA
         HW8mrRXp9I5Cgjr1GEQLzXevhM5qJkG6nVbqWYhbeQxNDKA0ZLhp4awDtvsKgLiClGR8
         LgiA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ/OmVU99kNhUNzzPaoiezysl5eZ3pLjqoVpsR0QAf5w3OECaDgJ4NDVozaHimuxhpENVwL49kJJXN@vger.kernel.org
X-Gm-Message-State: AFq9FYLtvUnLUTbxT4XAavJFqNV7RQO+sEFuNp7AdXTwSKzCLVSfEC5O
	wNjW0azmK1fDbazK+2zmrW6s6Jsr5EIUed/Ut33p0RMaBtEMl2DKMxVE
X-Gm-Gg: AYBFou1aURr32XJo7GnS5w6s77HQL5uMR+eIjdIYXnNrHKeYE3BaqwfXCl2/snAjSef
	WZmcLvzKmrFpeAsH15zwHdufuL0VVCYgrvXORUrdW4uIDAk0jsfzjyXU7nGAz9t4nD/I8tOEK/V
	7AS6Exag+Oe18T+OOpa7AkHsLmctgE2MCq6kHuJ0mc5gOyo03N3VfZdbRqqpYqNTAo9ewjGUE3N
	w4IK8qqTtX45sZnYn43QeCgQF7UXdKOsW3jTn9KejvJaPbcdVrO2ADlNFjCjnjUwpUtrMf07ihm
	RUo4e7C1R1az/Cqz2qgZAqBN6bxkXa7yNeUylTlk5cC4YoSie8me6ibAjsdiArjLxX9keXaB9mg
	ueyC+t07H1FUhNMJkHWPLGKe7h+UjbGQkkwGe89cuMt+Kn3Pa03O1Izk77NS2VffenxIfRK1rKE
	O3YeoYF9KZLmnoE17o68ZIb/0A/7DkCbx2WybDY5mIlCNtBmaDynpT0+h04jz5FYSwj1mGjyexQ
	bf5ukHJiqLxj7+6zfR3jDGmD0A8F2+SiErAx5vML95wqDHgqn1WDQyZlkhNxSMJTyzpqWrG1v38
	LP9jPMBU97AAqci2Bt/5Ng==
X-Received: by 2002:a05:701b:2313:b0:148:722b:7cbc with SMTP id a92af1059eb24-190a55c1a5bmr3066254c88.14.1792605189885;
        Wed, 21 Oct 2026 10:53:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm7114896c88.6.2026.10.21.10.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:53:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:53:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: soc_button_array - use __free() cleanup
 facilities to free memory
Message-ID: <atj71VUZdpHO4aBT@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
 <atjw4b-ICVGH3-2a@ashevche-desk.local>
 <atjyyqxnlqEvwNxh@google.com>
 <atj5pgIU0VCcrHHX@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atj5pgIU0VCcrHHX@ashevche-desk.local>

On Wed, Oct 21, 2026 at 08:43:02PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 10:15:43AM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 21, 2026 at 08:05:37PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 20, 2026 at 06:50:00PM -0700, Dmitry Torokhov wrote:
> 
> ...
> 
> > > > +	const union acpi_object *desc __free(kfree) = buf.pointer;
> > > 
> > > Rafael added 'acpi_object_free' for __free() (pun wasn't intended :-).
> > 
> > Not sure why it is better... It goes through ACPI_FREE() ->
> > acpi_os_free() wrappers which might be nice for ACPICA code, but has
> > limited utility in the rest of the kernel code...
> 
> Today it might be similar, tomorrow it might be different. ACPI objects should
> be freed with their proper APIs at least for the sake of consistency, no?

Fair enough. I'll add a todo to switch once it hits mainline.

Thanks.

-- 
Dmitry
