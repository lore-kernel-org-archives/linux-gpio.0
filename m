Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D823E38642A
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784458393; cv=none; b=CBq9p3oIk1apfXLZd9DV38zFCPeR+Go4JMKYouiJu2Bv5VSjPcDNANUmqJIwmimhEAhyDpZTbj29kEREYCGAUwtNVJBxDVNtCL2vxZQNaBflFAtQPqneoO2gWLf2pgzSe+tWVI0eXfRV6YHQk3hpjJ9uOwnw24fW7y1NAYB7CdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784458393; c=relaxed/simple;
	bh=zKjvMsZYJtIUhpEo1xk3bw7d2jQybETkW7pZt8OPLmU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Subject; b=eAV1a3YTU1pc2MjvjVrZD0HsC5UFLWaAUVZznpQ2IgVBPejuFvCGxKu3dWS+HzeoE/37QyC9BjMf2M+B1FJioPPQNht3groxzfWvEtUv+jIOzJgDzOwi5LvfNh/xjBSEPg7h7W7PbXg71GVVS8V8W2n6F8ABvhu4GgZIug733Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7GcQvtf; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7GcQvtf"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-49266a8770aso2974915e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784458390; x=1785063190; darn=vger.kernel.org;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKjvMsZYJtIUhpEo1xk3bw7d2jQybETkW7pZt8OPLmU=;
        b=D7GcQvtftPJ5/7oK84eFka3hxE4kIUZipXNJlIHAV1AEvueGUy51bqQrapSWVgT9Jj
         2LveJzd1qPP1eTOd9CirtaqQ2e5aW/LMz/X9j8ej9CE3L3SN+gqJEThDs87tJGKUjL+R
         pdV9cLcAwriqivyitfzYV68U1lfA6sW4txIlp6iBa0u5KLCUCR02nD1p6ULtHTKDlAwH
         ma4lh9102OsuBxoOpW6quwYrsViHtsRKmYe/km8D9Zbr0osixIQ6jQ8jiqIu4bFHVaqe
         mZii9ZiJr+JXRmAuLXoZHdBzrJTyL3iy/HwveZCY5JoCDQgLN3BDGMYExWiL46JqSkbZ
         8J8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784458390; x=1785063190;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKjvMsZYJtIUhpEo1xk3bw7d2jQybETkW7pZt8OPLmU=;
        b=cnIdlQNgiqdBaY5VHvMjEcUWppV8ons6Qu/8I6BTRJlYNlAW4oXZUQaAN82OE3pZl1
         Ihj/kGiFPC4WJJc3S8qYFFZc/D5/vX6gMJQWKUJDdNF3xe6MgAZIrXL+MIcZcWWX1qJe
         S/8yNmtlD3QG2VCxu9PB6Pbox21VEK4zZ5+CNaWWBIm7a/yd+Lxpa/ArVmmbXdVH3VTu
         20QGBm2E4UAwmI1mwvupxxH54Eu6N6Mi2M8S/kqz9bjiJCDv4F5QKlnkBXLIZAtSOUDf
         EN9oiZ+OHVklenjFHQambqFCRyu/L3ga7C5o4v6TFrnX9JqJFWFeKdDoQnhhPi9vb5Ro
         +bow==
X-Forwarded-Encrypted: i=1; AHgh+Rr9aY8jP9HX8/jrkgE0n7fwx33jh2CL/EPA0n2Y3TXnROgu8/zog6ffagBYaVwdyJeuzF7ygPX0Ie3v@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJyWsdH8bpc2FNlPTfoBU3HGaYp6w7XbvItkqXH++e94hj1pD
	Cp33dtQ8ka3cCF9gFrN5tlapg8EnzfmvskYr+gBqqadr3fDzuMpoAmw5W03/3cgA
X-Gm-Gg: AfdE7clwHejXNScgN5mddGSEMRAjmKIlusocRe6ZqRwhHQjwT0d+U6pc5WERVFAkESO
	JqBkfD7MC55G+1XSwzDKdvZ1o729QyObLkJsA+EjXfWSC/oSaeHmUxGlX3UsLbbRcxcd5EmPSih
	e9qG9m/pSTHABGQ+K61SR5rqsoPeppVSUEHXxF/3ww4tkv2Pkdr18y3aQs59DOF3e6axkPlxtK3
	NRFNekHeCMPd6OOMwNnHIO4AUt467ZMHvoM3s4T/HaxI+tD9jtaGCVqFw5wZ/7n5niaqebWnUnk
	lJQRIKsmIeo05MwKd75TIOwhkGQwqeJmYdH2opzvdciQFFOkjjJ7MsRvf+uopGJKHFCg8L5SeLx
	vukuCIITihrwBv3I07r/Xn6I9/Zp7nnreeMCLI052gQE3qYuxsxHZMXxNtiLTKTM5US/KwVaX9H
	gOdVI=
X-Received: by 2002:a05:600c:4e87:b0:493:e536:7bcf with SMTP id 5b1f17b1804b1-4954a51b684mr59912475e9.7.1784458389975;
        Sun, 19 Jul 2026 03:53:09 -0700 (PDT)
Received: from [127.0.1.1] ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e075d4sm141919705e9.1.2026.07.19.03.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 03:53:09 -0700 (PDT)
Message-ID: <6a5cac95.b39440a8.65068.282a@mx.google.com>
Date: Sun, 19 Jul 2026 03:53:09 -0700 (PDT)
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
In-Reply-To: <2026071814-online-nicotine-bea8@gregkh>
References: <2026071814-online-nicotine-bea8@gregkh>
Subject: =?utf-8?q?Re=3A_=5BPATCH_3/4=5D_Documentation/misc-devices=3A_add_gxfp5130?=
 =?utf-8?q?=2Erst?=

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTE6MDY6MjZBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBzeXNmcyBkb2N1bWVudGF0aW9uIGdvZXMgaW4gRG9jdW1lbnRhdGlvbi9BQkkgcGxlYXNlLgoK
VW5kZXJzdG9vZC4gdjIgd2lsbCBtb3ZlIHRoZSBzeXNmcyBhdHRyaWJ1dGUgZW50cnkgdG8KRG9j
dW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1jbGFzcy1taXNjLWd4ZnAgYW5kIGtlZXAgb25s
eSB0aGUKaGFyZHdhcmUgZGVzY3JpcHRpb24gYW5kIGNoYXItZGV2aWNlIEFCSSBpbiB0aGUgcnN0
IGZpbGUuCgpUaGFua3MsCk1ldGVoYW4gR8O8bmVu

