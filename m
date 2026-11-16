Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794819209;
	b=0iHlZFLeY9ju59DBO/c12L5Pw4CrEGcViuG6jax0MiBJes4OCIn/8hQtx50n3/lsL0b+
	 O4qFC67wG4pTH+JG3unQi6I+JGj9/WaZa0LCd7/UO8VtVeBBIKEWoNFoZQAB1FJ42sYbu
	 eKZG3rwEOFk2zhm5vEII+3gMp1aizEEF26TveKC5qQlia+2rEqdWCc2Mjazm78ik8J+l4
	 i3lIrJuwdn90+O46INAQLvNJLCfBltXrpbiDxxz0X9Vd/uDwS4yqy50mYGcYjanmXxgVn
	 lRuEXlC29bWLxfxNYvODjzGN3/NyK3hwae+9ACbeJ1b1AFsIfZswaZyqZ10f/SEhX+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819209;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vYfjevhDZrLyOdZirIUajDwiC49vLFzMXE7sYtqr+to=;
	b=N/c/7BUXHr+BTxxiLc0nKoWhCGdZId9fvoCfdEi9daKGMmV2/YW4BG5Mv1iaWb6DvWVs
	 yfXH9rTSm8LpnTrU+/lbn1vcd2fPFymw/5Sm2kBmCMyR/AstoIRhXo9RPhLN8iLq8A8Ew
	 9QML+4oAVay8l0iN2ycUx5mXOP0rFDJkOaIIyAjRwFVJNov/UL6vrSsXBbqdj+If4A0t+
	 ajay2T/Jn5PDjVLENEthrevJnvM9a8nVrSYnqwu4SwHTFsQHY7DoMShT5nVNNoZQAvLkM
	 4+zVYo5Dn14CXOlg5IpLUc/3QHjDIRjAZDqmatv9crZmdJ/8iML4XXI78GvGucoegsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pq9MOvdi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.12
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808F606A332
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 08:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3808F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pq9MOvdi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6YXy9tXj7r5dXwRyG2ZbmM9K2zM2vxqiEP/b6FzPCyEWTTWQJqFkh3YKCKDwQJeXeYUJZxPtPHTow0zrgq8zzvoOy7peZugsUWY1LnZ9vPmDqTrp5DGST3jwlLnrNgZZTOVEvlJP9yEETqXAjwdh+K5DRt979lom1IhmEQJJBnUvJpMNiOHU+ttlSXKRBcMETkP2xQNfeeVuDLIX6GJZtkS+n9FNkwzHZRN5Axd2T+ePQdE/9Tjd8KGfd2n6hb6q5yBsbB+Q7qg0ITJh5yVEH4nj3Q+PbJbfkE1c8zT333wBxx6r5b9gnEUihH28JyO26lIvz5zkUD8DJ4AGpDHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYfjevhDZrLyOdZirIUajDwiC49vLFzMXE7sYtqr+to=;
 b=P4TQa0MuspHvpAH2K5NiJdU6zZWxQVQLpkspDMRs/m/jFSElToF4g25T6DESKLy4O6fRtF92IzbOeyZM3QlFnhgJeDxdBkqbtu0cSOz9otR83PemqatGAMytqIfZ9j7BnBSsvYeOouz+XCHjm0pAW+Z3MeWMU9bOVjDord/L0r5IuMxdR1k0xVGCtTWCdN0n+CYaSFyI0sa/Nqt2nsGIPS+ttuMgjEaTpy9VZPmuPeqQdqHpU9jU+XsnUNQHf2Je496ZcSEdtH/HHjiGX7E33duesd6d0IlyiMjs1WmBaYzqPHVTU+UvWyH9aNmnQBfGY1z+ugoiSSXmiiu4pdNL4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYfjevhDZrLyOdZirIUajDwiC49vLFzMXE7sYtqr+to=;
 b=pq9MOvdiWjU6d+igok3H6lh+eC3arXUdzhoHJ6P7z7XWgJKPF/UpNyn536rhYykaQRaKvSwG4agyg1irw5iQK82ovPMnYQX9CPHLY4iGKRSYkzhB3gt7Kv6EEIQgB/daSBiSCyqkE5WfBcOH8s80dOUK11Xsvi5QJ6Gz8vUpDNzrZzsvjHKjKc2GpMcLChT8cz7ZeNFksWO9Ciiki3ko8aBcsx1XwGChmzUfXl8MzIwnrmgbFcLUthSbw58HdrkP/AxtXYKC7oWEcwNYpYUy3i3bdNUz4WPT4F1EjP0Tmcqn22/dLv6Jbb/socGLPvIrNmy+9lj6cNg8tgK2EYdY3g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:53:25 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:53:25 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 7/7] gpiolib: let the character device free its IRQs first on chip removal
Date: Mon, 16 Nov 2026 10:53:21 +0200
Message-ID: <20261116085320.2845766-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <o6i3phl3kkioptwivmiamw5n6bj7a2butqamu7huh35eulx4ta@cbigrjyy4q6o>
References: <20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com> <20261103-gpiolib-chip-removal-v5-7-aambrozewicz@nvidia.com> <sashiko-outbox-195211@kernel.org> <qabqccchlj6rz5tki6z3h7py36btm6nepdvlcz6vgbq37enfnl@ez2jmldpo5mz> <20261104141501.15473-2-aambrozewicz@nvidia.com> <o6i3phl3kkioptwivmiamw5n6bj7a2butqamu7huh35eulx4ta@cbigrjyy4q6o>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0027.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::11) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: baf0d263-1faa-40bb-4992-08df43bf1360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|261026121527099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	N9yXMMZMIPnRKBKs4VJ0pCLyRDTSOvtwa6kczqcs27++Ou1k9NtOq22zubU2OFE1LJdEuM5UxuMqh1udbjqDGkLOKoD4oSF91eDnU/Q2rrUulSOdNDoT3iPISDu274Jt5uUPpjJ5fLMydRXk4a5hoe3xb7z7QUDTajiKDtOAtBpLbnUEEt1XyQu37KlU3JCAlgUn+jeVvxmcpT8u8CfLcz+tYUFmD8vZ8UxQrdYt255VXVVOC5sh/oFrurB93IT6ssP26eDW8b4Pwuc4DIROKumdOpEvYuU66h9AlwPCBJseQJZuYELBXbvkbE22R7eDmbTwrwlIMzrYeS6cGT3vDsZRwc9/La3mMreqEogMUvpsIIxKaKc8G6Dt2+9XdwoNn47lLJEW4WCa9M4WfCImZLGjZ51HPC7/hj3g8CDpoPpOGM2Aztztyj+Yoqdw0Gs2bp6C+4UD7k38hY2+ZSPkDtHeVHdOx3J8N/SoOLrzc4810SoyYYu+1BSdi0akxr0vf0ZTH8unbaIR2PShntrSChTzME/JCgmYtyt6rJYkKlviDQ94LeDuVLXCSJG0uKTDmS3VCm7CvECaDhnx4/JABEwrAz/l+RzLJS4I9+RYFfCfFCYEZ9ZpNix83irYqhx6tveFfd+dMHZPap2ErJPr0lOa8CAPEsPkfDl2jeWTZNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ft3DsPc6M6cGh8vyPrG6TLSHD3GV2zKLKaWdk3XZD4dVFQ+xrCPfU4rXTyUW?=
 =?us-ascii?Q?P5dtrPr55lf5jA+eYQgpfHLnwOtURFxvK4NbJ7WEj/+9qSTj3lcjx00yo4TA?=
 =?us-ascii?Q?V1YTwXXYw35U9wkFla24P0tNyPoYGmlRJg7sovq0d73cSjszcGx4o2TM66/C?=
 =?us-ascii?Q?WVYfpMx4tNfbNq096EJf0aFyvofnvsZdODXAlDwjebubWLVYP5CDsUsQBT9i?=
 =?us-ascii?Q?MrPLovg0K0kub4QBqeIaZWgig7t74VfM2cqC64sIUNPUdb87tplqjbPXNszx?=
 =?us-ascii?Q?tolKSYxSRvolFb5+nZiLuu6bRAKvmUuWtKh/5L4OyBHr1Nie3cCYHQM0zrSI?=
 =?us-ascii?Q?wr75B3UByh5vpnINvB0PqnpCjsb8ezGZnedPB5BSO0b/iWH8rexSH1TBWoYB?=
 =?us-ascii?Q?xS1Q6IH5lEf+tp6tRwNBPw00OCquH2WK6oJ1TrO/IDT8m4M5ssHN0cvW5sjh?=
 =?us-ascii?Q?ufAn3BTEAx7+Dl6FtbvykRZz8wsf2d8c2w0nQBvfmdfK23O5zRBN02BKsmzI?=
 =?us-ascii?Q?lcDynJQoJ20zkhUJGktTCh9VobMOPSWozYeVslzMwbG9eN3Sxr5KAk+lcftZ?=
 =?us-ascii?Q?hQueK4jqi/8J3skLnSSUQAltyewmpdGqmfy31qTKnwKuCiEhUVvudI2Wq+cG?=
 =?us-ascii?Q?Gb4I66Diw+Prp37GuCODWrzhageYxm9Xl8DpAuUe89beUQksgFnHpBWuq13C?=
 =?us-ascii?Q?sAZ27kk8mroYIVMaRmzlI5aevWN6m7QtBXh5swKK3jiX78pCTVxTs+TIoKoM?=
 =?us-ascii?Q?Qe57TQiYoyu7dt26QAX2xpBrpgb7j7CA1POLxLFiF+bxwVumu4BANPIC0QaK?=
 =?us-ascii?Q?pxAQPimV3WhTpHE7KxcCqpparMrGOWLfaVrOxoZDdxTJhglBz0cptWVEamLf?=
 =?us-ascii?Q?jxoJpYPDDICfxFY9DHwZymfBlE+QQdRxxXSoLtExUjX+6P+b/TB/yd9SEipm?=
 =?us-ascii?Q?2osI9evZB/mXy3VSxIo8kcXfjhob/ZDDQX4bL7mNSygI7+nkoN6qwyiPh/Jb?=
 =?us-ascii?Q?/tgzbIJ1ViHkaZLw8GwTU4pNZcxsResDhwezDfdaJ4hm1c86i8X7iNuf0ET9?=
 =?us-ascii?Q?dSXV0fns6+6oEI7W9f79BdTm2U714TDZJREjnmODHrqI2A8jc3Db/Wd0kPTl?=
 =?us-ascii?Q?9VJP2G/DeJztFxMh3CArRcvmwjZpTAEHB1252a0c5aDZgJeC1kB3MHyfJtps?=
 =?us-ascii?Q?/3LXeE6tzgarUrOcUct9E5of/m+d5KXtwSRBkaywWTo0ebEhIuA1yeTRlaOW?=
 =?us-ascii?Q?yz1nV2BJrzdRz1nxgOlwe0ZaeoDcgwTidIetrShMSuNxkPhdcBW1svy7Z3J8?=
 =?us-ascii?Q?JwWv2iyzEFI1nHGyFYJJcfPFF+BMNUOwJc+J7Etmpp6ieBHAgEkGYXPdYbY8?=
 =?us-ascii?Q?2aCK8UmJHz/+eyuOzgz+0udgrvx/+AP5twP4IZFPRXFzNNraxXpteTFb8pfH?=
 =?us-ascii?Q?Abwlqh54oIWNCodXhhZtuXFwfVIvJEbuLL8/GtMzu9oBmeJj04nbQB4IRp9T?=
 =?us-ascii?Q?8nqMfDTwmYlT1MqqHp0kawdxCIKKlbHKcFkgXYS8qXiqxEyF/16XihFOrIVq?=
 =?us-ascii?Q?09a+zE+YFqy8+C8aH44Y7YuUChe3Ag3EmxpcHAakLVlbUPxzYpx3vMe2HKD2?=
 =?us-ascii?Q?aDbQXFomBrt3z3z+7zMlrGUudzndu8dvvs4U84w3ZkFEs3OueXPtyQvanAEU?=
 =?us-ascii?Q?hpL8Dx1+UjZszZ2/nQtBEhkGcygVWrAb8GDEvqoZyXoK0jlPY3M1M114ubN/?=
 =?us-ascii?Q?FoeBoigzsQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf0d263-1faa-40bb-4992-08df43bf1360
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:53:25.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIGbLWUbVkU3tAO/So+ABY3n+m424pG5C9a48qGdcRubhTJCHKF7SwY9pVEFAEZ2r7v+I8/fkSsmrV+vSDkXQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247

On Fri, Nov 13, 2026 at 10:49:17AM +0100, Bartosz Golaszewski wrote:
> Hey! Do you plan to send v6 soon? I'd like to have this upstream by rc5
> if possible.

Yes, sorry for the delay. I plan to send v6 this week, rebased on
gpio/for-current, with the shared proxy fix as a separate patch.
