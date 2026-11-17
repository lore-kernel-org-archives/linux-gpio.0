Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921381;
	b=Wyaf07YikczC49TzaeL8m2MOgdbfrWYSl3a9Fhf9BzjX+fvc9kVq9OuEd1vx3v9Xv37a
	 4XGb/q/t+Q9YNS5IeIs8O34fnrU6e/vV2jWJXfSxFnDIfclasT0pybrq1vI/3/8KBbjSF
	 Sivd+BHyHTHO9HN2lYHDkYWo6SePmqfryWGWXTiZLSDrDCrzOpFKVJ8qlm2k5HyS4gFjN
	 OrVyuQ/qdXEsU9ag9nbYATssVkTbsvgCSrO4DiuB0Q18Ph6cj/SpzJr2lapZICn5+cshY
	 I/scTltZ5aJ1btNqDUwIsBF7puPD51cG8vW232f26bzdj2MNDCVWsC4kt3X6WL6Uvew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=;
	b=BUEgITbex/Y2stC1SpolbgTw2qC4YS0gmiQbT9ZsqcIJ/15POShhNj+dKyEqVqmlsQMC
	 TPLJ0TCVVUWaS+74IPQXDrAC+jxSm1K/rYwJ8K/KyxXoBiJ3Fpmj6XItFeW3WHcLsNIIl
	 gxTL0xx18pTeCrmUNutlJfHMuJBLr0kAVuU1HCv/84UFcXxdEuhrQ5iGSDv8gXyovBU6L
	 AySGyRJ4T5Aj96T84mohvU+hceLAOT+3Le8GZX5sYumyMrrcegzQleJ2ynaJvfdcKfLFn
	 OoUZ0Pfz4O0OmCKrO/8nZR2Hj2v/zfJV/WqhOrX1EOuu7xr75bdmNGv4QFzO26b34ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9xDzHcN;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A4E606A32C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 13:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A4E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9xDzHcN
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so28382795e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 05:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921379; x=1795526179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=;
        b=R9xDzHcNtbAZjwxTgsRkpU00vR8dAcHdR2bQUcQMgXtJ29uPBNV5HvCf5l8rQttRoU
         j50+31s/MFCrwGtfCl+1y1JZbqGiPIOubKvNZyDPqfxwKninTM8eq2b6GncLMfzT+paE
         auuFwus4cD3ZKr206CdTVtqE+/XtjBNqgQt3JG+oJk838roaYk0uVLe3DmJkuF169GhD
         bGS1VT4+smy7G8XNBXg2mIFncStLasLSYFX6NxXHCa1heoQv2Ty4p9ebOqPruauNJqKE
         /QkRZTitMwIz85KaFilZbGSvvn8cXZzZ9Hz6PCgNNkIIr1qTyr65bFfoZO+qCiScLF9x
         qD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921379; x=1795526179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=;
        b=WPO+WcZrSt7de2S4zz/UAPVF+slIdUInm74Ns/SU40kHqgUloq7Wrtm6+K4aJ99mKb
         r+lhaspVOwXs06OBRO2NliE7V11HhzX0TIllOhXxhftzx6NIUU7qvJl5AcUUVdjuYF69
         Z6Pg0Qt4i+MS82yw7QJwDAY91olI2YmZL/RHSQaxgLuiIxOJ9Y6iQIaw0aL+dhaIW5aj
         G2teqdIrH/mUd+2BUFBJmialpCf0ESm1d+cfaj9qtJOmL35onHGSP7wmHnICLYVLmK7x
         5N+4F+4ViIe/ig4GOICkXJxKMvtiTRYkWiWsOG9HZUxCjz9oU4HqwnmiMlyipvnhOYBE
         jpbA==
X-Forwarded-Encrypted: i=1; AL+hErEXvNVLcq2riQWLMK32xCWFMxH0V9CbvQH7E+cwnwZ8TLYNp9KSyByvN64x/x9aiaHSICqrlTlsXx70@vger.kernel.org
X-Gm-Message-State: APuU4Z9rJ5NvyeEFmkwYL0/oMlugVSP6wVYACm4yd9FI4etRB5Jq4ipG
	CwZKnUJpgBHrt3CoCpBe8DgJmsRRBT224Fb3ImkQXj+eobkQ3TxtjEWqxr5Pe8pF
X-Gm-Gg: AYBFou3kIW0ThmSbhq1cDYgwp8tKYrwEd2o+bEdctWwjSLh+IKjVMs/TJrHg7UvMOFK
	hQwrhr7BgoR2r1Vk06Dzvakb7BjZ+BQMyg32kzF/3UaukMlrRXoL/AAjk/5vLdYJT0chauKu3S8
	77XizTgK34dpV+ijqukdbSCi4gJtrUblFXWAa+Uvl/pe3gI0dyh+WLAOL7Sm7+8e0x0CTn6QcrY
	Y/maZChMFRu2Ari4/0iLCp08lCzNaTnU3Ekxgb8EKWutwijevHyoyNYGizRftbd86cR7B+1r0/w
	BREuULj0+wC6aW3mlyNbR6LtmZbhF535R5sWLbdyJB2CXjEBj9Ev5d+azVk5WlA8kypwXn444cX
	FQfNZU0Om7uoqZEEqlmRecUA/DKsOg3Xof1yHtsXWCtYURgjNZ1lykUj0yrsn+Ck+eY01OMSjiJ
	Y9wK1wr4W3otV8UlVigOAabjPisGaaDCqyxHjgVMQj7Mhc5iMu4FaZNR+u12ewt1FxkQEEHlXmH
	JN7OOmlQAFSeO+FIVaXj5syplFTSjuV6VYMiC7FenAfujehICwBAs7RkEdsKvKQp7Pouwm0ait6
	/xuURqCOZoRTs69uR0a/Zi0GA8xzJepR4IC/AjsQAkIHzY/htRUZMaZ3AHuN0U3bjA==
X-Received: by 2002:a05:600d:3:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb55a50eacmr238269805e9.15.1794921378994;
        Tue, 17 Nov 2026 05:16:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm26817173f8f.21.2026.11.17.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:16:17 -0800 (PST)
Date: Tue, 17 Nov 2026 13:16:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL
 terminated
Message-ID: <20261117131616.0a631d5c@pumpkin>
In-Reply-To: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
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

On Tue, 17 Nov 2026 13:09:47 +0530
Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:

> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
> 16-byte field and does not guarantee NUL termination. A 16-character
> name fills the entire field.
> The driver copies this field into a 16-byte buffer and subsequently
> uses it as a C string. For a non-NUL-terminated name, string operations
> can read past the end of the buffer into the adjacent groups pointer.
> 
> Reserve an extra byte for the NUL terminator and explicitly terminate
> the copied function name.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> index aba129ead04c..c778133fadc2 100644
> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> @@ -29,7 +29,11 @@
>  
>  #define ZYNQMP_PIN_PREFIX			"MIO"
>  #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
> -#define MAX_FUNC_NAME_LEN			16
> +/*
> + * Firmware returns the name in a fixed-size field and does not guarantee a
> + * NUL terminator. Keep one extra byte for the NUL terminator.
> + */
> +#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
>  #define MAX_GROUP_PIN				50
>  #define MAX_PIN_GROUPS				50
>  #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
> @@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
>  	 */
>  	zynqmp_pm_query_data(qdata, payload);
>  	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
> +	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';

Too many constants....
You might want to try embedding 'name' in a structure.

Then, at least, you can use sizeof().

David


>  }
>  
>  static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)

