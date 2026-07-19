Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE08C391E60
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784458398; cv=none; b=PGFoxEDJS3Zjf5OC64I+cXIKc1IlcCQ2BeBey07YGhZLlSKbSZuOOjJ8beX+Qfy/Jpy1N2TSmTwIMjCc3ZKYYO360zH/5bjcskcTUpjV+PKjhT/BFBsCxTQkWdzsOT0IL5Cp5kqvRqjjn7Q6Vb2fahlRKMQ1mJAPAu+XqJSbfUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784458398; c=relaxed/simple;
	bh=7a3PA//x3G41UfQaAOXFMnSu1jAl9E2CW/KLlWdbgLk=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Subject; b=OLWdc7QwjO/Tg+tdKQF+8XrYtmid21uJzwYYrKk+Ycy9vBnXE5wf97XBcyB4giwMOiH3op9ZF3dmJxkSiPNYt8+io4WyhmcHAnK+5051gFVDqTkBbyZPLatZ5n8ks3/8CDmTgipc9Dckw8N0VCDEteOm5pUxoZ3xEO0du8Fcw2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvHVRn+s; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvHVRn+s"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-49266a8770aso2974955e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784458395; x=1785063195; darn=vger.kernel.org;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a3PA//x3G41UfQaAOXFMnSu1jAl9E2CW/KLlWdbgLk=;
        b=cvHVRn+suAX8Vs2nbqVuSRZVAxU/2eGHB62xQQ9T1nar2UVFTjtxn8u+sYVKAufeV+
         H08YlmK2okFlbS+knZ/7NgeSdDbTdNfqAYlflV1qDPmnLBOtKFehH8EkI6lKLr2RqiUG
         UjhU2vaV8DV0IAeMK2jpyewmjQUua9/OBiSpEPQDa/f5XmNpB4vtTrO6vzMo8W/VgcxZ
         KRP3IqD8SIkiWmwXa4YULeq4adYzigtIjuCwK2IW2FO3HBMwPA/tklw4b1QYbwIWsI39
         VGLqUX96ZcEXoTRVRfbZJdSoSI/VcWegVt2JoRSFRCKQS3jg0Nl/e8Aa4UIW4yefEI9V
         phjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784458395; x=1785063195;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a3PA//x3G41UfQaAOXFMnSu1jAl9E2CW/KLlWdbgLk=;
        b=kmjfOR60ClJ+o+HDCvgOo5cNPlh5WLbSiKWyvoF/v0udbfTpkuy24XO/8olvwNh0j1
         3FWE8SDskNc5oHE+Y0i1FTJfRU7MKLQ56vrda+Ed5Q2RbCuCD8gyY8+WcVsxVM0CDiZP
         0KtmBiPGzyT5jzOvAOjF6XruglreusphN7f+wRxSS97SRWjat5g0hh345ONLSywvLUxI
         +ldnGwD66CJ/BfnGj9eKZM8ZohAagjJyzWO80Z18RKUDLHZQw5VkdtKz8xN+ijJKhTc0
         kFWBpMWCLDeclqEJrK042mOb74czVbHXH7Q8us/J4piyrYsrrd8+4F0wZBdGjslzIvBh
         G/iw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+kCh/E1Xt3Fv3evPhrX7G3nrCvpbRYB4Nz0fVW5uCZKMRxpRJNpItDZoUnDgF8tphbdxu+U8nCJQe@vger.kernel.org
X-Gm-Message-State: AOJu0YyE8r9OJrjkJWPu1ro4bWauqD1iCX096gpNtoyPKcFTrAGT7XyH
	MaPMHseNGpmJdV2bo216OsIF+JeWT8xnejp3Ua5epONnrvoa9Mx3cOAL
X-Gm-Gg: AfdE7cnyjqlzQiiT4AZtlRP5+ldDYCpHjABg4R/hcdA4xjiE/Zg+stXH0CX7azljdeO
	UjvkelwS+w9Kqw57jXIscI16AqdhJXeX3cCwYQUTwCgVaOfF6hJnKTrqCLVILKQjUUNHNUkMAi9
	FAecANtbCPKa5yfeK/jOBPc5GhSylaVu2cUPzn4PAzMU4WoW2w/dbxbI/vpAlPiQVUVLiYXUiEx
	pD7a7inCqxUM5S0QVsVrlHcDkBTI8z/MHqJESqJ0hAVLMLWj3GOlBnJK8cca8TsHDlWHoBxCRvG
	cbRZmihs0wyTKAjPRA0aUhclwTATphNxMNNColR4HyUBRwZ1Pfh4K5QAXMPLEkDZjy4RU8ct4IF
	+HAiiNV+RMnsmQd2n8XnHCWrUA924z8dpoY6SmawHSnlabk4XFZh7Dn0wh6lenSBmSPy4DmTiVV
	G23m92Dyg5LxYG8A==
X-Received: by 2002:a05:600c:548a:b0:492:6e72:eee with SMTP id 5b1f17b1804b1-4954a50b65amr56505845e9.3.1784458394960;
        Sun, 19 Jul 2026 03:53:14 -0700 (PDT)
Received: from [127.0.1.1] ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e075d4sm141919705e9.1.2026.07.19.03.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 03:53:14 -0700 (PDT)
Message-ID: <6a5cac9a.b39440a8.65068.2953@mx.google.com>
Date: Sun, 19 Jul 2026 03:53:14 -0700 (PDT)
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
In-Reply-To: <2026071828-blunt-survivor-834f@gregkh>
References: <2026071828-blunt-survivor-834f@gregkh>
Subject: =?utf-8?q?Re=3A_=5BPATCH_2/4=5D_drivers/misc=3A_add_Goodix_GXFP5130_eSPI_fin?=
 =?utf-8?q?gerprint_sensor_driver?=

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTE6MDk6NDNBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBXaHkgYWRkIHRoaXMgZXh0cmEgbGluZT8KPiBTYW1lIGhlcmUsIHdoeSB0aGUgZXh0cmEgbGlu
ZT8KClNjcmlwdCBhcnRpZmFjdCDigJQgdGhlIHBhdGNoIGdlbmVyYXRpb24gc2NyaXB0IGFkZGVk
IGEgc3B1cmlvdXMgYmxhbmsKbGluZSBiZWZvcmUgYm90aCB0aGUgc291cmNlIGFuZCBvYmogZW50
cmllcy4gV2lsbCBmaXggaW4gdjIuCgo+IFBsZWFzZSBkbyBub3Qgcm9sbCB5b3VyIG93biB0cmFj
aW5nIGZ1bmN0aW9ucywgdXNlIHRoZSBpbi1rZXJuZWwgb25lcwo+IGluc3RlYWQuCgpBZ3JlZWQu
IFRoZSBlbnRpcmUgZ3hmcF90cmFjZSBtb2R1bGUgd2lsbCBiZSByZW1vdmVkIGluIHYyIGFuZCBy
ZXBsYWNlZAp3aXRoIGRldl9kYmcoKSBjYWxscyB0aHJvdWdob3V0LCB3aGljaCBpbnRlZ3JhdGUg
d2l0aCB0aGUga2VybmVsJ3MKZHluYW1pYyBkZWJ1ZyBpbmZyYXN0cnVjdHVyZS4KClRoYW5rcywK
TWV0ZWhhbiBHw7xuZW4=

