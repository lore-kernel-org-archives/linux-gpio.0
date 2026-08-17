Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF63AC0DE
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003514; cv=none; b=quMl74DzlO/NN+5KgDaLkVCWNlrjKY3j7dZiYw9mB2mpy7uKAgS/M/HeiRlrgggM48EumtvZpQDcfcPAnZ6mmTeAPk0gYxJGIBpRweq+b5UFSRFtk0JPkWHtFO4Mw/AVV1rYCLLwRU4IeDFxuMJdO0vGLFnwByw6j+m32y9ghh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003514; c=relaxed/simple;
	bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=B25r6i/3qN8OmRMnsFk8PXVoH4UN1v994yygK8hilMk0GJ6La8zgIW2QnLxCSCqIUU8S71PzPJHtSpmmkAQCVPGkUwUnPN8itdLiVpZcfqS37YddJf0cs34IFrgR/6FggGYlmGFtZCBlDId90DNu3TNPCebc6NgZnwbIDP+TO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxSIKrC7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxSIKrC7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2171090f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 14:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003510; x=1787608310; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
        b=DxSIKrC7OWT3udCwLzo/m2GVuYeCbwUYybIylo9o6YoqXHWKkXjrfpFISGiRNRcRhF
         MXl/TXCXX6uIP9zhKxECeMscMv4s9ylHyjQ3N+YDkYh1v7n0Id1WvQjXUjosRpWaczSL
         NFaR8yNAP9SS0AVlBFLtC2WdwcOM+mbBsU/dQ0sVURxWIzaHIiLNiRL9FKM3MsvcppAc
         X6CkKjoMQUQZ+fS2Thu6Y6soCClxqrDp/g7NQmqq7rLFgbqIp7q2sZwR2ZBiWggOchpK
         YgnhHBpdYcpZwkBSX9TXRK2Gl6Pd4JqPbnfmazmB0tsq/igNKCWRb9oEPZCIgFoX3Ylt
         QRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003510; x=1787608310;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
        b=ZRg/Tkt1rqIpXQ5ucmq8D5wHkWq4svHDbMKR9KREtMSAHRFrlaE0ijeFrCYmg048Fj
         a/JCxNHBaoSgG9eIpeNOoBqz0+sKmV2Fe0kqIulS57hy6jj38iLlssfn1prCZ4GcfFvO
         GyNzp3+XBoGTd2c2kEHjphvrLufPtixMQAzgYfrhvpv2xZGADZ4AiL48PHcpv+7ePi86
         R6zpE4nliw7Iv/QiaPujghmf5aMQFC0ONHO63cy6unhSj6VCoPazvw8xeWi+Qgpznugt
         RUKYO/1BQv0wplHGzy9XkctFkM4YFoI83DVsOVBWyIazev+JjTBbkmCOAREpJBn63fOf
         PfQA==
X-Forwarded-Encrypted: i=1; AHgh+RrvOAHs685DdeQ3soCoPzPUL3DDva6mLCRMtptg5/bq7C7cjCAXXSTSPc8lyjYNQH8v1lGi6TP3PbFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OHdZ6t6KkmhsK3jkcYrAW5CoeNaHQb1TQyPfhCxaiIEYhTYP
	J1fqF4+3nyVqO/GKqzExDGTUgEWw3fDhuRgaY32+rLgl/wVt9W3QZJzU
X-Gm-Gg: AR+sD13kNkBvFxnRIyG06ssa7II3M6AQbJgC6EJPocaOfpOG7wqS/2Pq84hqXAGB/th
	bWHFmqvJWwxirke7lRqZcC/BHhzGugFV2CU+NDY0NnausvNhGYfjQaxWKTrqznEfAAnQh+skxIh
	iWY3c6CnQzDPcERyiOgUsCGW2wQcubQqku1IppeHNfJweC6NhGgr/FUIsSkvSrD7jfRbn7vqYAg
	otLMOQuMPt7xrygzohM3cC1w6GDTZAMXTE81LhrrE5kGLlrZ15kW9RWAoFOxuTl+ANMFgAv7AQs
	gDgUwei4MYa3Ml1Mvx9tWCCiQgbPuD5X0GA+G1qakDgr7Gud8Gpw9ZShpoE8NjsS6d3lG/nbDLr
	Nal5i3IUqh1UC8goErv+j0Y0/tOPeyKPL51Eu51bZcXOwAO3de4hM9atvatNC1rsZ71WV2M6OK6
	JCZuktH3RmjaKI8Q5RmDN4FmTQS4/T31MVNvRdqqL3Y7HevsQe6gQ5YU9ih7seDNrCN78JrCyZn
	d5HkQLXY49VS+uQ+bBriU3BVeGn3pl8ud9OXjzy3XjFEghfKF5kUcXtyTi8Lh+dyg==
X-Received: by 2002:a05:600c:4e87:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-4998793867bmr392242985e9.4.1787003509504;
        Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b2a176sm309465955e9.4.2026.08.17.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:39:55 +0200
Message-Id: <DKRJMF592GX4.2ZR8HRZLIXWP8@gmail.com>
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>, "Cory
 Keitz" <ckeitz@amazon.com>
Subject: Re: [PATCH v15 17/22] media: i2c: maxim-serdes: add MAX96724 driver
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-17-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-17-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

max96724_select_links() sleeps 60 ms after RESET_ONESHOT and never
checks link lock status. Would it be possible to poll a lock bit
instead? The max96714 driver removed in patch 22 reads such a bit
(MAX96714_LINK_LOCK_BIT) in its log_status callback. Polling would also
let a dead link fail here with a straightforward message, instead of the
failure surfacing later as a timeout from max_ser_wait_for_multiple().

Kind Regards,
Artur Andrzejczak
