Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010154;
	b=QjELF1CwJ9hG0CMTQi5nnFwf40kBLvWVdyjzk8fJcmu6vY6OZqFp3VxV6/Dyh3tPOaUK
	 CgFID5AFlv79gLbqshHHlvXHvEM/r53FEIBwU4L3JExoddxcKAbwIt4WoVtCGqRTEQksG
	 +DDtl0jbwtGbvJ7AGFhIeirKQfli7A6bBW9rzQlaihpT1tvr8HSSCODIVm50d9mEPB2ht
	 UmybnDGRSD6EuvD9czu0mnYDMD9uv/JKVVbtHK7p9btSAvq9xdc4VCO/yPxzJ0Vj4+Ol7
	 UhiLitIece1xHExjj3K9j26EWlkJUOZu4YEcFlpS9GOv38gJiuvfj0u7Tn2bvWthLnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010154;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TMUIa6NXZkT5J+VgXuQQxCc5HC+EqyVdymjHgA9IWOc=;
	b=GbxmDKdqo3ucUqHl8v8fB/JYZD+Vruayhu6TYlDJov+dhN0kmyONhLMK1QvuYatNBRGM
	 5c44MPJ9KdC17VVRQH5D/UMj8p5qi04t3XhW+CQ6xXCoVsaLxaFApH8mJ1YZ0dHzayKNW
	 I9gIzXdOOQ5OQo8lnSs8earC/ErwRfu0l7eWlCRnSMMhYEQIbLSvlm9vfw5UtYB3beKZ1
	 LTjvecvSpKEnaYSviwH05boo7AkYCJVpeDh/RGKehUp6ALC2+38UMyN/oQ96bGzwj0xWD
	 5gE1U+IjpqNn7wf+VtmU4qS8Zw+nKREw9Mxj+UKR2ictefnz1hQjmtxlJV342j8Zaog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B3Z2BqCt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tcEdmDeb;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B4606A339
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 00:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8B4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B3Z2BqCt;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tcEdmDeb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TMUIa6NXZkT5J+VgXuQQxCc5HC+EqyVdymjHgA9IWOc=;
	b=B3Z2BqCt5nDUxRyfeKLK+RpZEurnlQtLyMgdNlLGSHOXcnsQ2RFUNe6hQJFsPot+VISA6X
	urAobVzhPtyrwrAQMv2e4jgQJnw0sc4YWJeHhpWctzkGZtjOOtpq34HkCQ+GpzsZxTJfQ7
	V8ofWAeFJPeMB2k6OPCsKUZveB8AQ9Q=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-oICCO_r2OkyPcxDQfjUyLQ-1; Fri, 06 Nov 2026 19:09:09 -0500
X-MC-Unique: oICCO_r2OkyPcxDQfjUyLQ-1
X-Mimecast-MFC-AGG-ID: oICCO_r2OkyPcxDQfjUyLQ_1794010149
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea9e91221so22000366d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 16:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010149; x=1794614949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TMUIa6NXZkT5J+VgXuQQxCc5HC+EqyVdymjHgA9IWOc=;
        b=tcEdmDebW39kpg5vgSNJ0q9f//+sf8X7g1QPI8DYbaGnrMpCNPGGTeYu5Uri7bOC8M
         PuG+jqLDVny8muLi1PpTCTJLErKxqGqiFNu7vldkuvCzFD07kW5fPrI45M4VXbqk7uta
         QtkAznq6je2MolRmg2etstUAZvzWKZ4tJaHfv6bhBUfXlFb0b2PUvqJGKetMpajfe6GR
         4I7I3t2PIwqT6vBQt03b4gx3nmBSBF/BXRC35N5d7GnBRvxSHaAprqaYUvrHP39ntlC7
         SANJiD0RbfIKKi6EjF1M5JcN9OEemIKwiIYH0Yxin7vhj94q8TgqvDv+5ll0a5GbMN9V
         luUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010149; x=1794614949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TMUIa6NXZkT5J+VgXuQQxCc5HC+EqyVdymjHgA9IWOc=;
        b=Jvy0VUBDuBjG19y8C4Sv9x8o++ptA5LBQxEmvLxO2omEFH9eqwdRNIcu46RFNCOu7x
         ieWxRg6lD8+wk/6RsYKBQ0wV3l12Xgfaxhdu2k3rPv8m9B+EOvX7r12MK2kSJJHA385j
         hHVCc1pA5WIaR+yDTE6j2/MP1oUxsTbqcgzK6PwCQDQTAiSsDczaM55XLvksITE1a29Y
         Rixh22EtqrMavkbwaO+O38aDMIjQKx5wUKW3MGRATZ9VFh3xygKa2bw6n2r3bk+JniYA
         V4rTrUvPlNOFVYXnTHdzLZXh7v5woqcXDeTo/mSjf58mSxBrpLSqwl8BSWWHY7IJgJAE
         u2Jw==
X-Gm-Message-State: APuU4Z8JQS9pJbuprKHpnExzKli0VrUNTYUtBlcnZ9p9wG1Pt3tLvu12
	EDaEB/nGTrDeUzRqXxbt7n0iNSqloxPanhDqY+UuBcYrRYde0pQDjpeLu/ztWyDjfFfqEbESQk0
	f2dj+xH5nVtH0nI13v/bxZCIbxIo7wAHvXoCiJ3qizpyG5/iEsw7uouA49LIGsRM=
X-Gm-Gg: AYBFou0Nc5IjmGOsA8x6WY/XJMX1hkKCwSGoGcF0qHWBI+dHqKnKv48duiXyJW4FiKl
	bOQS5+WN5O/qN5O7+7Z/NWMYNljEmHAw3aakWuWFC1Gix7kL7/oPYHyGaKkwRgKi7RBxIQ9Txsn
	8UPpUCaNXDaWh43OP0eDXoocGWkuB9YHcVGnRk0zE3aEv3v41GulHAYJqqSdFgjskfk9JxRIb38
	6BTOFq1RjB5kjYJZto5hdZQzRZ7kI4EKerFE+nPwR1jTfQ6iML/6mPYsEWYh9k1oar+VEcK/jtQ
	tPEL9GmnngGZZ+CTw1W5XOegZvUqDJF5U7mnKc/DnqAb+hWNCeHERjkBGFsBdM+pn7bNcNfYiI7
	ViuesTRF5Gq2yWfwjSt0eEJwgi3uWyvJ3/rzOwgbEkiHCXD/Og8aXOeTyBdalshZLe62iJ3Lnwr
	S8arcqk66N7Id/OzjL
X-Received: by 2002:a05:6214:5704:b0:91e:8a33:6434 with SMTP id 6a1803df08f44-91ea98cd744mr56129786d6.48.1794010148491;
        Fri, 06 Nov 2026 16:09:08 -0800 (PST)
X-Received: by 2002:a05:6214:5704:b0:91e:8a33:6434 with SMTP id 6a1803df08f44-91ea98cd744mr56129316d6.48.1794010147906;
        Fri, 06 Nov 2026 16:09:07 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c4b8sm31998536d6.15.2026.11.06.16.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:09:06 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] gpio: convert to subsys_platform_driver() and
 subsys_platform_driver_probe()
Date: Fri, 06 Nov 2026 19:08:43 -0500
Message-Id: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVRi0m4iljQzjAWJR2EiLsrl
 l/y3n+BUhRSqLMLIu2iMocEm2fgxi4MZMQnQ1mUaG2BZlhkNrr1eqrxWDlE7itmhvRYIrEcX61
 pf6flRG59E3DfD8dYF5ZvAAAA
X-Change-ID: 20261106-gpio-subsys-d69c66fb9fff
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=734; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=E62Nm/ge0XA9LCcUxy5qK7fGKOdug8nN6icSr1xENfE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5Ui7/z02bdPtkInpnaLqHOckSuVfNNu+W69ns9t8b
 0eN879THaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExk0g9GhuVnRUwqQ47seZGk
 8Ye7w19+w0Xb3dp7ws/3TJvS9paNLZORYW4996ELbwVYHQQV3u9JPNok+dSw+/D96Aj/yUX/3P+
 YsQIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macros subsys_platform_driver() and subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      gpio: htc-egpio: convert to subsys_platform_driver_probe()
      gpio: tps6586x: convert to subsys_platform_driver()

 drivers/gpio/gpio-htc-egpio.c | 6 +-----
 drivers/gpio/gpio-tps6586x.c  | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-gpio-subsys-d69c66fb9fff

Best regards,
--  
Brian Masney <bmasney@redhat.com>

