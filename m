Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8C738E113
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784458392; cv=none; b=o3DGSF1VM4ef4ojnQfL0kBkXZ52JavLkPEVGskCVR3A1Jy7FpAqSEeW5SnbkarfxGkcZi8jQnl5Um4GG8Q7HPRSOkj3yC4+eo11K4cUcmSXbmzNUSAIM/lhqhcac9VW/e/dAmZwKZ8eswCHU+BdCaEHk2fgNfYoO9t3W1tdxyKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784458392; c=relaxed/simple;
	bh=nSUugbg6Zm5K6TkJVSzDZZu7MzUj3h07ZOpInD9XoqM=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Subject; b=RqEA1ipMatWGHidoq9Ci+TtDzrCY8q2EaU5QLqf+0iQ1CMGnyBY3sdHbvTxJN4fJE122dHmqAupR5Zml40es/REnqZoD9y+LD4nOhsjyoOyZeej8OxP3PezZuNwxldaFxcZTV57H9CpYGOvYZcVVGLWtXaoupuzkc5IW97Awnd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwltyhxu; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwltyhxu"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-49266a8770aso2974895e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784458389; x=1785063189; darn=vger.kernel.org;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSUugbg6Zm5K6TkJVSzDZZu7MzUj3h07ZOpInD9XoqM=;
        b=fwltyhxuTU6/vKez13vwwMGKEkdNlqxv57vueG0xrcTWQrZLWSiUvewOJwv2FcHDcR
         zCjuGBmhNto5YIK6Em/6J54T/Nyt0xvM3/+9FcTymYGt300Ccx0NHiDxKXLSyUbg6y+L
         uvo1RueAsjFZNb7WJEEKZpf0VFBWSYKUbgHmX1T0O1hR1JpZyN8hqse+zMAAngj3pDgQ
         Y3RkeW7MgNlWGRUMOA513yOFXzmLosDvIJJK89I82z1GWV2EA08IudipavsAZtlwEwTF
         HqkJU/umIySxicNyZSJQ/fFi7iXpD/fA8lwKUnUCM95648OMMEJO1M9fW2CCaruHlkEN
         yvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784458389; x=1785063189;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSUugbg6Zm5K6TkJVSzDZZu7MzUj3h07ZOpInD9XoqM=;
        b=YDMqic3onL8dyQrCj1657Wv9cbe1s8QpCIiTcD9FT/nxfCse6HZb3tWpkR/UAxAEOD
         RI6sKEKdZZtvscecvSg7CE2lvoDlw57u1ecc0G9VQI7SbJ/Jtr2Z1ivhGFy2wQyxCRf4
         3jVFuGdyYaDzAPdJ7O0BsrDElNhKdqfdkFokfCtKYO39R0RvA1IYcpqWysGs27S35rZo
         OczkrdcI5uV2O32nPhMg6G/nT6gnd8chUFLkpKQRRD9g4Y74rvT7NykREZhUz1eefbkh
         ydzqx6HlWzBLBeuwtRkwcXZhNdhTSOeoLSldoGAnQOJ8LZQapvQkLmdeGULW75+NvAMk
         zypw==
X-Forwarded-Encrypted: i=1; AHgh+RpRotNyJb0D5N1lT/33+JKWEHpi8eTINhLp86SjzCXZ7EV2g/p6FLUZYrhYzF2Z3llQMUZBrvmwh7Az@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq3kCtUanuRbMMYi8uyzkL0f/AL55svALJM0uPI2xuW6auRP+5
	+imhVrUREOFKIqWcA4SSWKaJ+D7y/SYVMcnpTYgPxHI1HHsgOgoP1g3rTBYnfBV4
X-Gm-Gg: AfdE7ckIu3p1/8UoCMO3A2NEBWMC4WOPqxvoxNngVawre0LYu+kyi8TZfaeIOlVO8mO
	kExpmTt+bs5Fl3TErAw5UIpDVF74oeZo2rvhGlpIMU6VPFwes6EsCbnbW+IQZUrYZ9TgJvRdmbG
	FRsmSquakhmUZiKz3VdeM/ErrSRQ3SYMzRVFnxJXoiFvJNQl8/BCJZn+cwE1YConGYQFu7Suvah
	MhSukNDw9sGD577rdGeH8fXuaX3OvREY9HAnuwltxS3diTzddNOG0Tgbzuf9D+6M2ZMB1K9f06H
	pkP5Tk9IiLFgBjaCvLFqBnnz1IGKhDJ7so3d4HsCqnqhuXeywYLXV8C2sdOcCEMDns/Glv+CjlE
	0RhyRi+KRTG3zjK1vEw7VUBMZtImQpdshPMzAbG7AXYrBDquU73WYlrYtjJMuLs2r/qyFv5dqB7
	JOMYQ=
X-Received: by 2002:a05:600c:19d3:b0:492:506a:f48c with SMTP id 5b1f17b1804b1-4954a50b806mr56201465e9.4.1784458388816;
        Sun, 19 Jul 2026 03:53:08 -0700 (PDT)
Received: from [127.0.1.1] ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e075d4sm141919705e9.1.2026.07.19.03.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 03:53:08 -0700 (PDT)
Message-ID: <6a5cac94.b39440a8.65068.27ee@mx.google.com>
Date: Sun, 19 Jul 2026 03:53:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: =?utf-8?q?Metehan_G=C3=BCnen?= <metehangnen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org
In-Reply-To: <2026071842-trillion-ogle-1f66@gregkh>
References: <2026071842-trillion-ogle-1f66@gregkh>
Subject: =?utf-8?q?Re=3A_=5BPATCH_4/4=5D_MAINTAINERS=3A_add_entry_for_GXFP5130_finger?=
 =?utf-8?q?print_sensor_driver?=

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTE6MDY6MDRBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBJIGRvbid0IHRoaW5rIHRoaXMgZW50cnkgaXMgZG9pbmcgd2hhdCB5b3UgdGhpbmsgaXQgaXMg
ZG9pbmcuCj4KPiBXYXMgaXQgY3JlYXRlZCBieSBhIExMTT8KCllvdSBhcmUgcmlnaHQg4oCUIHRo
ZSBwYXRjaCBzY3JpcHQgaW5zZXJ0ZWQgdGhlIG5ldyBibG9jayBiZXR3ZWVuIHRoZQpHT09ESVgg
VE9VQ0hTQ1JFRU4gaGVhZGVyIGxpbmUgYW5kIGl0cyBvd24gTTogbGluZSwgYnJlYWtpbmcgdGhh
dAplbnRyeS4gVGhlIG5ldyBHT09ESVggR1hGUDUxMzAgYmxvY2sgbmVlZHMgdG8gYXBwZWFyIGFz
IGEgc3RhbmRhbG9uZQpzZWN0aW9uLCBub3QgbWlkLWJsb2NrLiBXaWxsIGZpeCBpbiB2Mi4KCkFz
IG5vdGVkIGluIG15IHJlcGx5IHRvIHRoZSBjb3ZlciBsZXR0ZXIsIHRoZSByZWZvcm1hdHRpbmcg
d29yayB3YXMgZG9uZQp3aXRoIEFJIGFzc2lzdGFuY2UsIHdoaWNoIGNhdXNlZCB0aGlzIGFuZCB0
aGUgb3RoZXIgc3R5bGUgaXNzdWVzIHlvdQpmb3VuZC4gVGhlIG9yaWdpbmFsIGRyaXZlciBsb2dp
YyBpcyBmcm9tIFZvaWQ3NTUncyBvdXQtb2YtdHJlZSBkcml2ZXI7CkkgYW0gcmVzcG9uc2libGUg
Zm9yIHRoZSBtYWlubGluZSBwb3J0IGFuZCB0aGUgbWlzdGFrZXMgaW4gaXQuCgpUaGFua3MsCk1l
dGVoYW4gR8O8bmVu

