Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375927;
	b=X5PHJtiIvjO6OYEl3kZFoKhNuoszRtXdRDN78q3JuQ0vowk1n4+8tqownCAWn5Li2zd/
	 pFBzQNlc2Okei1zEYL0h8BWidG7+I7C72UvK/1p66MltZLHJ1Hz1hiYq4L4S6UAvJhqD0
	 bv13przWbO9DkrHsMVrZuLLr5kMLW2gTCgeZxLEmQCS97HgmrLg1+6VtK3pZfvKaWWp+/
	 CbLVOz5LVZtraRjhiTyu8A3rMUe5gH+u1q4IsxbAnMDKmvUCm7UezBZ+LcEQFqu1+ZJYC
	 yIpDHgokaIUTngFtEmgXie/qHEb4/LYEIWF2ifNw1rjsaA4oPqyO+6XUlMlVueVIhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
	b=EzHI5r8FVxBU4KMop/TarK0aOx2snwgYaAjUZ5j9UN911JxXJB+1brzRpjSZ/yGXpiNS
	 sQhxfRXzmvEABwzEMApTdo3AjaL8rUr8Vd+VkZAtDyclI2kzOdDJW5hn3S/wt2UliCEwJ
	 Bd7if2xujPqq4ITSdotQfSGawln+P1jD9T0qw+hCAow+3WRwpzO6FfTOXTKjOSt2vRYnJ
	 nCN1/FxVbqkr0moVhxJdOL61++sW1wBu7O0W96cne+9pKn3WZnvMm0ZeuhuHiLqixBTQ9
	 oIGMATPZXEAG6l8Wqo78wArTZH1f9YE5jQUl2pO5Ge67iisqgFK0Lz/G9ub516/71/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=no1NUXfu;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A81606A337
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A81606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=no1NUXfu
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9191215e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375920; x=1793980720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
        b=no1NUXfuzQQ58syEI6DSHr6K09poEWBp1PheN9m+LUUfmjsSyv8P0XyGVA/mPJO8de
         QUmQx1u2N6as6AqRj8HgJb103X2/s7DmTeCXb/EYZsBN1Zk9OQWJTbM37BFtoQFXA70w
         EJ3RAzZiXKcpYoL3ZjqhHXBqOEZ01zOctuTxbNSI+E0R92C/vQ1S2PchXRJxg5aFvfpm
         lIGnzcidYTVTlqqUfiLvox6Pjs1dkINosLRrA6PQJTb4OC6xA1KRvtNE+8yiOD2ndIaJ
         oJ+ogN3bwjxFwKq7W36emk4xLJ4rq6wRA+NorHKhwTIWtrN7lgyEkG3rlz1ivOnSzEKo
         PHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375920; x=1793980720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
        b=snMimuxcHKYaUTbyLQ0VQVLd34vFYDN5s9KoDJXVgUiy8yWWnaB6+5iqHUHvIHGI/2
         Biwyu0JBcSdvr96SzhOzRnukw0+kpe7+nnUaTQBhheYkDpeQT/2N/h8yTX7djkbFm4X3
         nCtpu94D9tvRAvzv3xAgTkPEnZbrvFBan2TQYv6p5NYfOhgClUX9y96c5D/LVSQ6JZVR
         Zc2BmCgqv1Cnxy4LowzUKRI38k2PLs9YdJ8r6XKsnDuZ7cpiOxHMLFA66u1Dkp7bQczt
         kWyLg6E5e7+GznJ48UPniDCvmkNZFVnl/bIS84BLKBxZeSbsZFNiFvayD4RXshGz8eP8
         NFFg==
X-Forwarded-Encrypted: i=1; AKwUvBzMm2pZdjsMwN92NnbGa+vLrpHVhke8TsUnuOaT/WRJwlqcA6bE/d0u7o5Mg1/1oJJm0xUC/gxbSltU@vger.kernel.org
X-Gm-Message-State: AFq9FYJEQnX9K88Ib5zY8bQzh1Y7vqyDFWPZB/b1uAGcqni6bHheHqU0
	yHtaKF3WoOmDp2QAASvr4a6fPSVADh3+y2JMXlElbshjsgtCn3p3srI9MZSkClOn+i0=
X-Gm-Gg: AYBFou3SA1/G7nQya6TaY/EFlP32GfGVnepYaR+m2Uz17jc5lENRIHDEtrHdWJb4aYg
	5C11nmsppnIWptqtmdZGMweAEWfbu+b19e81TiO5Cs4Nb+Z9CQ5EavRkDGDUlwzedGC5lnxjk+/
	UXsMoxybB3tpVZZZtZX+OBbepCRu5TIpghxHbsNjtY8Z22wIC4g9AR3VfDZ3zHfaPsl+RCADeiI
	RvRB9uTMSzCZc5KawhwpqbOQkt6kVZSbUWBgPCNctHdZ2OrHl8dobgYa4XcJgmzfdd4Lkiaemxp
	cpXL4vfU7fNWzLmhRN+4UyrrLXajSTNQd1s7VS28DB2X6ZjvzA0x0UdcnGW2Jugi1nCcsbP6AKH
	yvii5GS+eOYdBhz8SLWrtPh6NBlaCXoa9OCqkEo/tvX2d1HH60jxkqDAc4+pvYxPK9vwym5OXwS
	EIz+uC/xGvVrdH3W9jikQcGA1Zs8gXSiANDq0ZXouypkTohQxYmEBMziPlY3Z3+b7I6fNVWFp6X
	nxuIXpWxtE7YbtIQq/m8t35WTCeDWPPvfVOek+7XirrqQ1lqnQ8NsHA7mXtsSbKwwdDUH3RviOL
	ykoA/2MfI1kSR1td5mJDcTemntukL53PfrmtVUx7mlISNAUZyG0=
X-Received: by 2002:a05:600c:46ce:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ac18a88820mr62818445e9.33.1793375920100;
        Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm5738054f8f.53.2026.10.30.08.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:36 +0100
Subject: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Use only the identifiers
that were copied and ask again for the others.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 42cb1aef1fe1..69645ce73d9d 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 					   const void *response, void *priv)
 {
 	const struct scmi_resp_pinctrl_list_assoc *r = response;
+	unsigned int nr_fit = 0;
 
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len > sizeof(*r))
+		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);
+
+	if (st->num_returned > nr_fit) {
+		if (!nr_fit)
+			return -EPROTO;
+
+		st->num_remaining += st->num_returned - nr_fit;
+		st->num_returned = nr_fit;
+	}
+
 	return 0;
 }
 

-- 
2.56.0

