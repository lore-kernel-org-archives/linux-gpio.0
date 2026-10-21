Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603435;
	b=1NRSUyEEwVtPSuW6iaPZUnmgJjBl2bqU9jKZAUvMfD6klrHT+/vZPbXbkIaH9jS9QUJn
	 WIL5JiBSQQ8v21azBtZR0b0kc/cXo2LcIY089hgu1yJ/19+APtvKfH9vVkWm+MhYtLOkU
	 D4KgCd1+zDwypEWWV5pKB0yaqc4emL/UL1+MOadnwn/XSrNmv3mt4QRTZpTo0KpHzbklt
	 Ni3Rpvx/IIMerHXzohC5QErD8x5nBZoSUmEAjD6V286sjnKIEad5F1Dqqyi9fA6CcCZ5A
	 0KXoDm3jpIDWbtRhBqd/fADBgB8zluOdvPiXm3+S85hD+OiI52hu8OLmQY3gbCw/2rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Xq/Mntuw9H/QDRiWvp5bTN6HG/D1JEq1cQYOqHkRs9s=;
	b=GycUsmA7uTvyna4L3SQ/YFu33/qKdwM53fwya/rcEvREY5f29dBN7tWdUh15lmntT0Qk
	 BvRvPziVf0PUswFpK8xILR3K8E67uKLhXs2hyrYYoeXO1vc6ajIC1D42V9pkHrt1lQpII
	 GfpNA6aEKIrL9OcWj8KVM30328g8LN1nUWk/18/q+zJtmhO4vEm8adMQBzrV7x4ywEdsT
	 lE1glloPPCF7G5W8mEeYCGl02wJkdCO+EaPRT+BJ5kikoUwfuK5YCBZuXugBygSHohpqt
	 wj7xrSu/0xw099+RrRlRwmfk8ezucUphEBYVg45yvfdpLnJa/Z5zdYgGQ0NTbaLHl/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sGg2zhx8;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6B3606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 17:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sGg2zhx8
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-185fd3a4ca3so401666c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603430; x=1793208230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xq/Mntuw9H/QDRiWvp5bTN6HG/D1JEq1cQYOqHkRs9s=;
        b=sGg2zhx8XpQ8Y5VWsNzVZmU+N+t47KA2UleuuqA+pv1bdRFdvq+jMtwQ/tTGUHHEdF
         iwSdBVrtn5guZIGBqvqjI2TEM1KWoKWAafzY2dLUCwcnRt4U53jsa7f+gKX6b9N+HTd4
         SBjX6aGM6nnwgR33oZLRdcXBG2MYVs6OPxvcNIcRnC43Mr0PvcjfN2zqUYJ7AjwZqIAJ
         CcRcCll3/sl8aCkBOe6iKkQrmCH3jPlq/5YyJYkPJeVJJeX6bL1wPSFCkim1HL6vl1PF
         jJFOfHsEQwRT8pGWVKX578gxCYZFA1M0/k7THKtPhhL4s3z8EbBp9+dWN+latvtZlZ2Y
         7sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603430; x=1793208230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq/Mntuw9H/QDRiWvp5bTN6HG/D1JEq1cQYOqHkRs9s=;
        b=tD8TRYh87QbuVdkRg6dd4OXRxUIQ/G2iZP+8IMPenRkX7Vx+FBfqsVqILM+btwSPr7
         q7dN5kydfYhczMaHA35OJBuwEinAYKQUvf6zwYTDqYflXIyzYT6zBBmHPSmd0KkYyGSL
         SZrND2AK3TVDMT992UkLmDBUf/IkBnjzvFJj4vi/BweDTQqMc1a5kFHU6pOaS5gYPXod
         jqVsgEmolFCbhybpwzroc2WyXVawavOovILZpB9J1+uCuGz+IgBwM8r5PnAEZriFyAXk
         SUT9V8J1Z2G4CV1Q5Dx7CkJNIKHKYBQYnMoIplFdcEs3EDQh2engAvbKo/UIrLSZ1G+u
         vUFw==
X-Forwarded-Encrypted: i=1; AKwUvByGxUHcsCat10pY1JnLb+BD0LTGbObRXM8l8rdaxaprot0/qZrwff9PoDP4TIztWic7jUlI2lS+xkCf@vger.kernel.org
X-Gm-Message-State: AFq9FYLoy3Ti68ZYezCeFq7GGkhynidqrCgjOi6/T3b5UQmdsDIrQlL9
	gp/ZYinDWEYYwf/N/OZexZQE36SXWgn7+KInadMJNziMLNNoWfu588iO
X-Gm-Gg: AYBFou3BwCXIj5tSLzAocgfqdUPuLZCJfbqIgOQ8AbMXnFR4puECk6SX52dqduC0mAK
	TWrsxJdNB6JPf9kvqFF84rvHS/kwB2CCh9iYthjJZhxZbWxWs4D7FPI0TUPRPT9QEZRqOOfOXVM
	s+FM1HEIoQEDmxGQ2LvNy7qCyfPeywOAYLQlCJJn0APmATaQbikrvHl2MJ4GNs4a41iZzrjaETi
	hQZCUBZaoUDnC/RhwogFxlZHqZ6/LuRKqTdw/jzqnFHjdbsBVGwm0tt7tWWR24I1KEFYalBGgw3
	4DLNkgmP9r5RH2iCEh/VTnbOm6jScTCQhnBfYJ/OZf64bbSmBNoVdCs9fOxhKIlCb28/6N9CNbG
	6Tf4K3TgaqLjq9bQ5Lap17BXWLSnBZvvgOjUCFjU3Yo0lSxMzIoV1TIbSVC7HiOdLiBgS9jc6LK
	kyi0DzYdcL2lWYKxDn+KxqUTjlOjgUHYifNTAUXOBINVCf6A7Y8UKHOSnnerqKv8EVbwI9vNEcB
	k1Ec7QbR4jaFMoiAw9OkMNJFswNiX6PBBBV0KvclqmpOU9ZT2cAIrkBc4C4H9/1Vxdgs6QSJW0E
	RQio30diBGEjY/OGN1qr+wDGJeaJZCqUtmsWHkRDfc0=
X-Received: by 2002:a05:701b:4517:20b0:151:70a0:6bfd with SMTP id a92af1059eb24-190a6239183mr3020964c88.24.1792603429511;
        Wed, 21 Oct 2026 10:23:49 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aefe90asm7430112c88.9.2026.10.21.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:23:48 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:23:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: soc_button_array - convert to software nodes
Message-ID: <atjzqdtaduFV6B7M@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-3-dmitry.torokhov@gmail.com>
 <atjypFBUGPzWv083@ashevche-desk.local>
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
In-Reply-To: <atjypFBUGPzWv083@ashevche-desk.local>

On Wed, Oct 21, 2026 at 08:13:08PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 20, 2026 at 06:50:01PM -0700, Dmitry Torokhov wrote:
> > Convert the driver from using legacy platform data to using software
> > nodes for registering 'gpio-keys' devices. This allows us to
> > transition away from platform data and use generic device properties.
> 
> ...
> 
> > +static void soc_button_remove_swnodes(struct fwnode_handle *parent)
> > +{
> > +	struct fwnode_handle *child;
> 
> > +	if (IS_ERR_OR_NULL(parent))
> > +		return;
> 
> Isn't this redundant? Because the following has it inside already.

Maybe but it really is not obvious whether the latest flavor of some API
handles error pointers or NULLs transparently or not and whether it will
continue doing this.

This is not a hot path so I can think we can spare an extra check.


> 
> > +	fwnode_for_each_child_node(parent, child)
> > +		fwnode_remove_software_node(child);
> > +
> > +	fwnode_remove_software_node(parent);
> > +}
> 
> ...
> 
> >  	const struct soc_button_info *info;
> >  	struct platform_device *pd;
> > -	struct gpio_keys_button *gpio_keys;
> > -	struct gpio_keys_platform_data *gpio_keys_pdata;
> > +	struct fwnode_handle *parent_node;
> 
> Can it be one line down, so we keep reversed xmas tree order?

Sure.

> 
> >  	const struct dmi_system_id *dmi_id;
> >  	int invalid_acpi_index = -1;
> > -	int error, gpio, irq = 0;
> > +	int error, irq = 0;
> >  	int n_buttons = 0;
> 
> ...
> 
> > +		child_props[prop_idx++] = PROPERTY_ENTRY_U32("linux,code", info->event_code);
> > +		child_props[prop_idx++] = PROPERTY_ENTRY_STRING("label", info->name);
> > +
> > +		if (info->event_type != EV_KEY)
> > +			child_props[prop_idx++] =
> 
> > +				PROPERTY_ENTRY_U32("linux,input-type",
> > +						   info->event_type);
> 
> Make it a single line, you seem use 100 limit anyway.

OK.

> 
> > +
> > +		if (info->wakeup)
> > +			child_props[prop_idx++] = PROPERTY_ENTRY_BOOL("wakeup-source");
> > +
> > +		/* These devices often use cheap buttons, use 50 ms debounce */
> > +		child_props[prop_idx++] = PROPERTY_ENTRY_U32("debounce-interval", 50);
> 
> ...
> 
> >  static void soc_button_remove(struct platform_device *pdev)
> >  {
> >  	struct soc_button_data *priv = platform_get_drvdata(pdev);
> > -
> > +	struct platform_device *pd;
> > +	struct fwnode_handle *fwnode;
> >  	int i;
> >  
> > -	for (i = 0; i < BUTTON_TYPES; i++)
> > -		if (priv->children[i])
> > -			platform_device_unregister(priv->children[i]);
> > +	for (i = 0; i < BUTTON_TYPES; i++) {
> 
> At the same time this can be transformed to
> 
> 	for (int i = 0; i < BUTTON_TYPES; i++) {
> 
> > +		pd = priv->children[i];
> > +		if (pd) {
> 
> 		if (!pd)
> 			continue;
> 
> ?

Sure, why not...

Thanks.

-- 
Dmitry
