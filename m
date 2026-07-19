Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E993911B6
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784458395; cv=none; b=DKmucOluicnv/+KHYFkpbdHEFl4OeFv3pcOccQ8AhfFrY3hTgqbubhr813f4shkorjn52H+pyP7K+iW+ZIzklailWfOeoMMSaUSIMSJdmaEXM6FSEUCg0cLAswBTsQIS+N1NkbXi/Qr+oKm25Xoz5b11ifd169VJzVBIbdRr9RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784458395; c=relaxed/simple;
	bh=pA63VflcxP+j4+8wOB1f8R+Ru4uzCjEmE2cEIV1sytc=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Subject; b=URoA2ZOGJNjm2Yf/2GGXJDaM5tHTW/mF8dtF5BhFuiF5RVtyP+H1EPDsrWJKuyut2aiR80wLwnV4dtnW9cOdAW8/213w/qfbMvq4XJvriBIRdE7Csv6fI49Re6r8eqpQjJETzj79tQMRGCzkyVxnSFY/RMPAfhWzU7W/dxm+mgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AchdJJaZ; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AchdJJaZ"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49551652105so357735e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784458392; x=1785063192; darn=vger.kernel.org;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA63VflcxP+j4+8wOB1f8R+Ru4uzCjEmE2cEIV1sytc=;
        b=AchdJJaZJ+TwYONmK6vagYIc9k49rIOa5RdSrY3V2dMWBjnddNzINdEUye+aDC5tAS
         NYZzRB9b9WtlW2APSw8DzUW/NxKY13eSuPm5IU59oTZKuUdJ3fDXuVzv4Z/+WqaOfKXX
         0HcaKQOown2bYThXkO57PCSx50Vn9fXzL5UJNT9U3Yz56Vtg93EGFAyR8kDipRl4gxJV
         iGjJEah1bEEyWJJILjRO2yTjRu/kbpEAmmq0Dg/FHOo+wb9GbhBVX7P6kI/tNEOLmhYB
         tQ2xFViSHv0h0X17FiLnN2RJMr4un/DYtd5M0urRZ6MLze52uZlbfrL09Y8gYmydP3/X
         lX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784458392; x=1785063192;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pA63VflcxP+j4+8wOB1f8R+Ru4uzCjEmE2cEIV1sytc=;
        b=QrB66E6nQyvK/n5Y16oCPBmtANZAlb9nJhg1AwxLL3aXL84qoamc4CCVQHpHtald50
         zZ3fXAb7BvYE1jPxrxwhHnUPYK18wr6TpCln0RBwAC+L33ZuFxOi8WIiJTaiB2h5DVAu
         s691HpoEKmy49jNKt2qDSKTa/Yflc+ZQY5bXY47J7f188R6crPhTdW/E2q4tzkOarfdh
         5erDtrn894y0K4xaAsNcHVZrPuG1AqqnMVnFzYSlvkkKzAPJ90JyQzzhWzxTO0lxJ7ck
         l2sp5mNax729QWAeDN/tH2xRgSGdoyaGzuEfWEFB5EaxhbNtkVW8I1FNHW9BwmtiXFHW
         QPtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7VGINH1RFS7n1z15M+3MExamuRMkv8sUZnaOQio7LlxpwJkImGmSpqatxlVqcwy9mbSwKVviz28E/@vger.kernel.org
X-Gm-Message-State: AOJu0YwoRtAcAiOgxtRM8UTo+QFq2UAEUM4+5sTeQRfTpY1uCC/D1ntk
	X0TpXB0TP8SO2wQ6K/682A8WZS/FI6u7WVfjPA6Z3UbTTBsWR4qBcf8D
X-Gm-Gg: AfdE7ckOvu+8aRJffwWw4Y/Rb62E6YR1BRdW3uoG7wLishRyyNAuoOn75RfKAWGU5we
	uWZKbo5G7XmZiuByJIhrLr6/EQCRnUbAp2oqK8GHf6S6Rq0qLQx4ILuxinkTsKek1zJHoTNcGEk
	wYJh+cXZeSboDN+F84p5v4LjbI/iNSbAmV5Z5nIp55hPoxIqVUsMIkOAamJyjglorS9V39RcYGF
	/MiGmYxpYKxrhdL/5eV5j0cIOtqQRps8Az1TpyOwFJdop0Isot2CdwkCtWpkSVKLygLV1CMBrge
	U2nUfO5zbiXUjVZglnsorlcvrkNcK8EVXq4mIm+6IOdojCBr0KE4jxqeIvtbtbOVSxgWfa16/LE
	ab/TkuKe4Zr1sMXccSM0F1VoY8yEbQCor5Otvm6ipxmGbgl4op6Of09fvEUXIP7YJONz4TMikgQ
	SgwSoapWhX84mjiQ==
X-Received: by 2002:a05:600c:1c23:b0:490:846d:4edf with SMTP id 5b1f17b1804b1-4954a3ebc81mr58673285e9.1.1784458392404;
        Sun, 19 Jul 2026 03:53:12 -0700 (PDT)
Received: from [127.0.1.1] ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e075d4sm141919705e9.1.2026.07.19.03.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 03:53:10 -0700 (PDT)
Message-ID: <6a5cac96.b39440a8.65068.287a@mx.google.com>
Date: Sun, 19 Jul 2026 03:53:10 -0700 (PDT)
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
In-Reply-To: <2026071801-headdress-gab-348e@gregkh>
References: <2026071801-headdress-gab-348e@gregkh>
Subject: =?utf-8?q?Re=3A_=5BPATCH_1/4=5D_include/uapi/linux=3A_add_gxfp=5Fioctl=2Eh_f?=
 =?utf-8?q?or_GXFP5130_fingerprint_sensor?=

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTE6MDc6NDdBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBDIHZhcmlhYmxlcyBkbyBub3Qgc3RhcnQgd2l0aCBfLCB0aGlzIGlzbid0IHJ1c3QgOikKPgo+
IEFuZCBhcmUgeW91IGNoZWNraW5nIHRoaXMgZm9yIDA/CgpXaWxsIHJlbmFtZSBfcnN2ZDAgdG8g
cmVzZXJ2ZWQgYW5kIGFkZCBhIHplcm8tY2hlY2sgaW4gdjI6CgogIGlmIChoZHIucmVzZXJ2ZWQg
IT0gMCkKICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKPiBBcmUgeW91IGNoZWNraW5nIHRoaXMg
Zm9yIDA/CgpTYW1lIGZvciBfcGFkMDogd2lsbCByZW5hbWUgdG8gcGFkIGFuZCBhZGQgemVybyB2
YWxpZGF0aW9uLgoKPiBObyBkZWZpbml0aW9uIG9mIHdoYXQgdGhlc2UgZmxhZ3MgYXJlPwoKVGhl
IGZsYWdzIGZpZWxkIHdhcyBwbGFjZWhvbGRlciBjb2RlIHRoYXQgd2FzIG5ldmVyIHdpcmVkIHVw
IOKAlCB0aGVyZSBhcmUKbm8gZmxhZyB2YWx1ZXMgZGVmaW5lZCBvciB1c2VkIGFueXdoZXJlLiBJ
IHdpbGwgcmVtb3ZlIHRoZSBmaWVsZCBlbnRpcmVseQppbiB2MiB0byBrZWVwIHRoZSBBQkkgY2xl
YW4uCgpUaGFua3MsCk1ldGVoYW4gR8O8bmVu

