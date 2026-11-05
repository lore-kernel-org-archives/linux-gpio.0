Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793853936;
	b=ex/ZCx42QW2r9fU8DqMV+EVHQOu3QvqnHQ70uRT+eTQ+1m91KsOQIIJUWa9FJeGC8uq1
	 /ZREsLHbGATXVPGHOBun79wVCrXPsCb1yM/PgNlJ7XcpUqOGxhOFXDGpLBsr6MDfp6HEZ
	 KdQqQpT1Td0Cspa+jY0Y+gM6KAT5UNi811+m3FlSM4RUr+Dk1qpAOUaOX7O9LIvf9vR5J
	 1KdB81+jQMK+30cK608HLVS9hloXHsOeCcVzSWILfAqC0tWsiYi2usDgU4bw1h1CfHVpb
	 UZ+5+3G1j4k9yo0AMW8iD0He8xzQkE/fI1gK1GIf/zoXxjKUlYxmZZnd5SBV57NqNiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853936;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LC8E1JU+xlKJH/C7dKOwhVxP2QcBytjIO6k3NitYgsI=;
	b=ZNaOeX4c7E+xmOXqnMAnTE2AdoVV7c4HlAmVN+sULRaBee+bXvIGBPBpP8YdXaeyHXJs
	 2/mxr/5H55gjDepKey6Y5ofHtZ/ee2GPd+A1aR2bAHfajMq68WZNGZpviS+XB6lI/1eAY
	 nNhrGHsrPD94q0BAhIWvKi6BwzneGA3llOgeicZUbV85AO6b1FMzjV76NnanWDV00o0Xh
	 p5i1Nd//kFpu9ubdSS6IL+zTK10LaGyPANtXrK7xp/s9iR7uJ/vUS6R08LwHyL3nMsCrT
	 iiyMH7Vt21X2GXYJZP/LjwRSQ8zpeFCnAZEmK+YZ/XK8t4wJnZtVM6LZJzUpNxFm/Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A45606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 04:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A45606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso774656a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 20:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853936; x=1794458736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LC8E1JU+xlKJH/C7dKOwhVxP2QcBytjIO6k3NitYgsI=;
        b=WR++P+vUg7c8IsXOepfu3o5vCkHQGhdfLym4gY+YFMHwcY09vKS03WF91+V7lt+IJ1
         VUnLHjpvfl0t3XDQy6mmCb847eAWqBg890JPwfX0foKqyNjgo7VEei5SXTwSKtF6lISj
         OLgfSnJ6YzHXhyCSUlGunriiPbuWFBdf9tYrqnKPtUe9jvsfZK0bRzIftkI/+UX1xEz6
         IqNpYT+CaHOAybEVruyZTYcw4UlzZLUlMfHqv+fwFH/Lw8xIxvThwx+yuF1auBOPu/2j
         re/IAMLLvX4O1new6aQw7MPCF3te+fWLtQoQTnTwnBxcyyqrwCy4IbsR/LDACf9ahXXX
         iw8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNwY1leZVFcmOvK0EJ8EoCKt4sr8ALxo0qfU9BYcACMnJPMjG9diXt2RBZp03cdj0TFzoKHj1UvRpK@vger.kernel.org
X-Gm-Message-State: APuU4Z8RjwI3y8C+fxXM8tZE+Mq4Z+HBCscwqIwsCEJRn3YSMctVTWtR
	1JhFXpYkPDiHtubP4o1/8F8JvbQZygvsOnQMsoxScdubRjyPimniirwaAhGfit5b
X-Gm-Gg: AYBFou0NSliCJuKWVHQ0JJHy21a/dU+Pe0n2ijgNJ7Ci/aJxmC53fzhBM+8R113KYu5
	druHsYfYV7BH5q7WDO8ZGckm+zcJ6g7FMLNozEPKglsdOC6EDpFtPXidKRWatwp37ohVlAzjydO
	qN54vpKPcGxkmi91BTtnJX+w5tuiQBFGI8EJ4/yqUBzmXDQ6E/NeUtekwH6gJowrX/AhOKN3cW8
	6ByxcU+egzoa3mwclRtOfFWeFZfSJd2uvVdCVnJXAFaCn6hVTCYg5MxNU/A69JL0gG7oJBGa4T4
	46/oprhR1CYAsF5jPSdcJrjlJza9y7nV6OzbP59TWrIy8NSnpqbDa3ysjnffcWeXzIk8Ch3Wbd/
	SbSwbG57M6c/3Ef4HtPSju1nvw0EJNHTkzr9F5IAg+leGS9/ctGTTfLfMGYFDhiNKHa91uUDloH
	vTiFks0Zf0TDk1iN5PLYFUlCxERtE0LvRJncoinhum5mbcDbpA6B+p1carly/XML3fqgEorbjce
	C4rJVfQLBDCy6365nR0nRRR2P1tTYWM34ASDhNqxehglWw6eRJgEWqonMYfAEWES9mKUAPER6gk
	kcxgBgQzfg/jkI3PxrhpSUOHEmXqv4EK8gcOwqhHCExc5VsAm86D7hCjgFAOyM6f6pUO/Y5Z85H
	iY/6Ozyd9sHBTt9t8/ODOkfrhqtZwj59E3+ORUf3ATTE=
X-Received: by 2002:a17:90a:e70c:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3ae8979969fmr14287766a91.38.1793853935713;
        Wed, 04 Nov 2026 20:45:35 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3265a52sm1605355a91.10.2026.11.04.20.45.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 20:45:34 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so1159618eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 20:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxaYgLihskJ6VHx5iO7wId9JT89Ti/j7Dc6UwwmYaWW/YLAZsKCgwGtJKOiJTOvjKdmzFyBPQzyLhT0@vger.kernel.org
X-Received: by 2002:a05:7301:488e:b0:35d:d671:933a with SMTP id
 5a478bee46e88-36a423a2dbdmr26720849eec.15.1793853934050; Wed, 04 Nov 2026
 20:45:34 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <20261104-geiger-handler-f6688647819c@spud>
 <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com> <20261105-cilantro-neglector-a4cdaf9bfb2d@spud>
In-Reply-To: <20261105-cilantro-neglector-a4cdaf9bfb2d@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 23:45:22 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6wP=NUM-vC6vadWk2sgsKV7HHBGzmX59SW_nWFcN6jsg@mail.gmail.com>
X-Gm-Features: AclHuK8dw6v-9VJE5UUbXK2KpxAN1TMyhZVbSc6sgeM46dW7QyrpEt_39Ek2lZA
Message-ID: <CAPY4CJ6wP=NUM-vC6vadWk2sgsKV7HHBGzmX59SW_nWFcN6jsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> huh, I totally forgot about that. I guess you don't have to do this if
> you don't want to so. I think all the generic stuff expects pins to be
> numeric.

Thanks. Then v2 will keep the pin names, with the driver's per-pin
groups and pinconf_generic_dt_node_to_map_all(), so the binding can keep
checking the names against its enum.
