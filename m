Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823215;
	b=W/ql49rggafVZo1rZmm7j3FvAiBLsqmQYAOAATyh9WqmtKx3VGCCyKjD0AJs2yAUGljl
	 Usz9/X74a/oxgWJKREb93so/jnYsL856ETKBu4/1fHZ0GZHDfZ7qlZ8rB+1xttVmxv9i8
	 +Y5aBS6HVUWCB3loSW3cR2x/meurRPJNOeVN2kTOmkdRMxP/c/X8D9mSN9loDuWCoLtB+
	 r1XfTasE1xKVQWucDPo8x7mQ1SAOSt781P755o19QD5gVIOB7GTWBMl/1/v135OEmTD1v
	 /HSOCTiDT+igv8p5Nx3zNmHUmNhbt0NdSJ0Lw35HLsWcaZJkir1fHonbiTydoQDsljA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
	b=ocPYovCgUr1/2tcVF45R6XEUNEitbKDgnZ00oNGhBUEAlhY8cLv2bPQ0GUn8KpoUh381
	 tqW0bKteDdTnJkLgh7D68o+kGaWWGbtPYPbu7u+ZnQzZhYTY8kdZsw3Zly7S2SjmA2Dol
	 b6o22Fm0W9mJtQOaWEDJTslTZ5gGlOIDrCgHNqCq1WAr3STDRcu6PRaR0RFRuvZoplNFG
	 +hO03HAyrPmyZNFERq4H5wIHBrxhhpM64SjZfmf38ALfkMblLbGoR3NvFqPsnmj+WopG6
	 THQ5B4pr+PmgBSoGQIbX4LZNUyCLpr/xNdU2Q20RWzD1jljrNPKVBe/HjR9iMUtf/Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZyfG2ka;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25F606A329
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 10:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C25F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZyfG2ka
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1489063f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794823213; x=1795428013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
        b=EZyfG2karYEC6c2v8a9CVKvIn3VTpcvJjBWEKWkwZnMuVrzc3zfNGmB4Mkt8Q2Nxlk
         GefOEJ/SKzAyW/cCiDPKHIfnla/ZHoqVairWDum9XOHNcvHXHpgaqJs0jZvAbCwtUw2y
         /OZRstU9JA6TLMOPBwJlQBF2LZ6sSivDXJo0tgTSmk5h6DWDKhiX+f9OHcScLEV9J6M+
         9D4an3zou30wtp+HhT9CGL+Ep+3D2RjGQjuSJZHW+4SNUt2H2ocP5BYNUlEshsgKsM/I
         5v8n/qJqE2icsgR6ZMA7JHiNnOs7SKAGQlpCgutl27CEGsil1AOla/GK26pcMo8YWu5t
         kOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823213; x=1795428013;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
        b=sgTV5V4/BvfhVb7XWTu2DWZgczTCmhUCJhMiaBQTqAlQqiDKyy30K3EeanxygWMciE
         6wLZPaJg2n6SD0TMSKu3jQj3mTEnDRcRjVEZ+ryLEHXGOsINelJ4Z8ox3k/upvAvvEAa
         EE3MCt0/WABX6wxHL+duPFtfmDjhPrFlYPIqOd3jGcRDKOHgChU+V3K9SsiMXB8KwFNy
         oTP6KR03OJ7DdqIaID++5CGhv5Oq+UZgTrYcmHd9+ZPJJPCO/Db8fMsFY5P2X1xjJh9l
         z6N3a9rlVn5yX6J1gCzC8iKcskc1E9a2GMafV02vbDpfnoBWqztgZjoI/0nSEwrX1aDH
         b4wQ==
X-Forwarded-Encrypted: i=1; AL+hErEbzQbkV9DeSh22/gwNMwpFdGLIgzcn+4lNaOeMTjDUg+p4QFLgPnD5mfQ8rxPWVS6+EPIDuH5cTlHm@vger.kernel.org
X-Gm-Message-State: APuU4Z/58PB+P6oj8FKV0gR9z3CSvKzccJ6iHd030VXe+ZTkhwgKqRLw
	SNMUSwxwQ5Ky1UsaTMC1Pf3ao8wKvPhA+nCsfOyfJZwgEJ0nmUx8evH7pVsi+cl/vo4=
X-Gm-Gg: AZFdTZebp1wEZxe+7uSPgQYo+MkOkz1HYRv8seJARImFNBC0hnnoVrRPYmS9eXEilvL
	ODr/zNbK2grqQhxjKmeY0r/YdtXoNEBXn4iGbD4RS3xy49R2HYWh/U6ynvZvdJdwZ3ovcHx1//o
	9rhM3tnUPnLdtIh0VF6smttgtKSPWpu8RZtwMFNO/lSqWJnKe6lwBBp9D3qKiPDe0t+RS7ODh85
	q4YNCANq/0C6QrHp9QJJwWtWT2xqfUWPZ8vD4yIjfyxssgGxwFWArAI8eZe1VdllBzwCjI1nRSl
	Pabt+nJNJcm08TvOKKB1GC59xksOU6jnXquvmvonMkmauO6J8Tz9wttVaSuIKiTkSY3raFcHOVz
	HcnOT9bOyArBqtvfMCK1UJYYETkZTt/R0vFOjA4CeBy3pCFGMyv6XmjwTjCQCSdOF+qGoSuqB8Z
	S0FP/ULCCQf6Dd1qtpP+1YqP+wWzJs+ZlLqhtCuHH98BcxpS/mbBLjhCjlaOmw7JalGXKVgSUWM
	TiRFqtRUCgLjgOsnBD+QLdzhxRty+R4DcBkONifUK4sKI2O0BsfvC8+vw4DoQk1vrwOTl7cppOH
	OuDJDNiq96Q9fIATEqhjkN9Eg+KBa5lHgA==
X-Received: by 2002:adf:e008:0:20b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-49c71e3e1c0mr15349062f8f.9.1794823212810;
        Mon, 16 Nov 2026 02:00:12 -0800 (PST)
Received: from [10.48.2.141] ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ecda5sm20247717f8f.37.2026.11.16.02.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:12 -0800 (PST)
Message-ID: <ce463c97-8fde-44b3-b3bd-c21a69ee61b9@baylibre.com>
Date: Mon, 16 Nov 2026 11:00:05 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
 <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

On 11/13/26 11:11 AM, Linus Walleij wrote:
> On Fri, Oct 30, 2026 at 4:58 PM Clément Le Goffic
> <clegoffic@baylibre.com> wrote:
> 
>> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
>> driver registered them as groups. Register pin-only functions without
>> groups.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> 
> 
> Patch applied for fixes.
v2 went out after your mail, please skip its patches 1 to 3.
Its patch 4 does not apply on the patch 1 from v1 (a line join Andy asked for), and its patches 5 and 6 carry the arm_scmi to arm/scmi move from linux-next.

Should I send the fixes of v3, patch 6 included, on your fixes branch, and the rest as a separate series on linux-next?

Best regards,
Clément
