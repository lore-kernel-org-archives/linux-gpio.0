Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991231;
	b=ErXFvvueNG7wF74R6HfKcy0W3YirkIN448iS1uLpnvVkg2FkGQJpo5h5NjqQkN7D1Pt0
	 Ut40DVhxD+KQ8Rq46hRkOA3/KOF2RucyFzPMoJ5hwSh61M0+7AKM46MgUGCBG5sEIa9b8
	 QRdLC4iChQ7JjU7NSdTAbroFfth2TAhpmqM5GrJKOa1CnqJzPm9cMouVz9quVPN/nhVkp
	 Ia6o3Ryoau91igeLh2IFSQV9FpcrylNpfl0pEiUuwTVOfcnXWLxZTykh79aJkehbxal0e
	 BdtAxogORjfGbLi/3hN+MRl5MjXnfmJNpGB6iD5eTexdX85XYZOf4+34XVucBxSzurg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991231;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hXofRKU80HobS0eEy0BLJ+bXjd3BZ1obLil78HUAOCc=;
	b=IPnrX3W102o9HrYhsHAqG0UZoJlioEdvuW6oAG1M2CIeJ/ivae/Frm8x6+Uehwd128MA
	 iijwPonY161aSWl7k9TbV9wePBWoX1JwsfJt/flJXiq68TMJRjx+0mTv1rR2odjyibd5q
	 i7kJ+Hv1XhCxC8yyCNYRfwdcX01VdnCx/n1wico64T1FIy0r4g+C4HV95BHhV++mBVQh/
	 YUOtNArfcjE1EVNx+sFvS9NiLViXxHfhS8+ZlRF6EReFIAqW3yBz3zy4Ry8z66DJbhXKA
	 CqdvLpvHqeMnyo4jSm1NQ+QapHwm/OigJOEtplRO4swKawSUZy/qi/DwVX/lYewIbVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1mnv6mBb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.30
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661AD606A32A;
	Wed, 18 Nov 2026 08:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661AD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1mnv6mBb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylmUT5bZfDxB2qz/q2ZzLjHu5uCWoSQgUuu15cwHEDzf7BlzFLqy+sCvNHbrf0IR7Hk8i9jDB3IK3ZmiRk1VscNZbRlL047qec254BFjHE9JKedOuoe6GA57b6DlmhqzVeIGroFidLQawlICeOLw86OXsyOHcHQLsYStO5aK1HvlkTyL9t8Neb+ySp8gxPzSGb0Hhu4MM+wzePwPEd9w5/dtfwtuUHUhXFKhk61bE5uyuWd8HZ1VTKp/iDhWJYC/s9nv9qezH1fT3g5IVeWZcc+HMl/YxHfiGhCdy/O++SZ2ZF+OA+eQzCat7i8tBOCE78xbfxnnjURQxrkVU9nsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXofRKU80HobS0eEy0BLJ+bXjd3BZ1obLil78HUAOCc=;
 b=SLoFIcAgEpUs8J2eZDzMsStehdH2UrOB57+NOQTAGKZgJNTjh8/WghJuJ1AFGJjC/1wqpX89t9US9DbjhRyhiPp6Du3MF4LY/7xlRCJb7CnXCstp8KJyK/06fUn69CQxWjsk2D5jmWaCPvMbeQpMCg4rftEXZv3vSXrml6Rl1vr6zncWsPbzO0iHcRDW++7QmdZBTyONp7NSO/EQh2x7lJF4JR8+y+RofQFLWZ9pq8CcshoPNroDrb8+weGapWru70kYAj2/+xwsexy/fIDp7bzuwZyrksbeH56d6nj+jsnam1gAWdvkzB0ooODcGvhfCpBtgO4NZe8NFQ2uHUMrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXofRKU80HobS0eEy0BLJ+bXjd3BZ1obLil78HUAOCc=;
 b=1mnv6mBbp4b1DGGSepdPXBBRpUziwF8r7pbeBMtEV2cxldV8D+zDDemC2OdbTKpFJLrSre667Lt8grZGSnPJdYFNarUV1xImHh5anvEqBDYwCBdoSrdWWPSwFf7DDFfLEcqBOJIWaSyqsY8/ujogWqhD6YDYCZSSgf60GFU7nvo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) by
 SA3PR12MB7783.namprd12.prod.outlook.com (2603:10b6:806:314::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 08:38:22 +0000
Received: from DS0PR12MB9060.namprd12.prod.outlook.com
 ([fe80::e096:864d:d60a:c83f]) by DS0PR12MB9060.namprd12.prod.outlook.com
 ([fe80::e096:864d:d60a:c83f%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 08:38:22 +0000
Message-ID: <85ff5be0-4fad-4d92-b9f3-2553c7c4365b@amd.com>
Date: Wed, 18 Nov 2026 14:08:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL terminated
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
 <20261117131616.0a631d5c@pumpkin>
Content-Language: en-US
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
In-Reply-To: <20261117131616.0a631d5c@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To DS0PR12MB9060.namprd12.prod.outlook.com
 (2603:10b6:8:c4::12)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB9060:EE_|SA3PR12MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 44271f06-7127-4522-db4b-08df454f4ddd
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|6133799003|3023799007|11063799006|4143699003|56012099006|261022115727099003|261026135527099003|261022075727099003|261028144727099003|261022113327099003|261021121427099003|10067099003|261009221227099003|261021123027099003|261009223327099003|261009221727099003|261009223027099003|261021135927099003|261102123227099003|261021130227099003|261009220027099003|261021133027099003|261026140227099003|261026130827099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	M02bDW2vX/UFPgDlNMzKUcnnMejPN8yeQVCQ36C7ysCQ2vYsELALi0vbyMCbSUCDPxiC4ieMOUswRFFEwpWPyYBZgNSYa+vQyRKKkAdE32Ziv5fFx4q3rKyCSUN8pSNNutxyHdH2ATViciUsKgDjNqy/u34spUCTHrYgVZvyW+31ACRmup/VdmjXLQ7yj1MRhJbNAYzMbKFSiZPUG9UpA+460UUbE2iwBzRedIjmlIkyYAVmy1Tb4ODD/5GIYEihM2oGofvsDrkK08yGxomSrDAoMnVZXPLA61xgkN/AgRiAr+EGH0Z+fQO5RpHsUeqxZ0e2pFlfVGAYHDv7yqMMl7s0/zI/3DrYbNHT5bD87vj/sI17IRx0Qlc0edLgswLUmEb3i7xXLgpx2TOPMNzyGWiX8UPIqhumvOofBisiRinqkYwOe+CQeYzSLhSU7K5wnBFJkjVmq9aVomg6F1uwRMuUgLbBGTbGItx8qpNQ+JMO5JTNv1c47o+XCWGRFlmSSh+IVW+fx1FzoHfln4qg2KVzyPppXCY9ErHtzKYWp34DFwP9nq5numaZ/uSYh0jPouBLzsJG58m7NMQd+iuu8gzau67lOLAfManqLD3Z8OwUIpWX9KZ6nqBHbBRFJDD+fEAzj+aXizV089s61jR/djjZXjREEoi8fLOs5PbXPh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB9060.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(11063799006)(4143699003)(56012099006)(261022115727099003)(261026135527099003)(261022075727099003)(261028144727099003)(261022113327099003)(261021121427099003)(10067099003)(261009221227099003)(261021123027099003)(261009223327099003)(261009221727099003)(261009223027099003)(261021135927099003)(261102123227099003)(261021130227099003)(261009220027099003)(261021133027099003)(261026140227099003)(261026130827099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0hxK1Y0NHRCR2pna1BIUEY4NjErdDVWT25PTllIZlFmMms0aUoyczhqZWtL?=
 =?utf-8?B?TWF4Vlplbnc3ckRzbENoRTl0cWIySDRZYncwdXRLVUhCUGNOQmdmVkJwNmlw?=
 =?utf-8?B?cDRNbEJCSUx6ci9HQjl1UE5JY0tWUXFPMnQ0MXhXdG5UZDB5R21uWmROb3ZU?=
 =?utf-8?B?dlhNYmJ5WkZhalFZYnVpcXZpK2R2T1pqSnFVSVNWQ25WRVNEMzRaMlIvQnBI?=
 =?utf-8?B?UGFOYk1lMWE5ZklvSzcxRVpxeDRPQVZwb3NoajlFSWRoRlQ3eSt0Ly92R28z?=
 =?utf-8?B?eXM5VVJtT2xSWEdUbUJQa3kxTXh2R3RLVzRsQzFBd1hNY0ZkRlBPTkIyVDRZ?=
 =?utf-8?B?aWhaMlVsY25JNGdXdldmc0dxdzl6MEw1S0Q2dWNlc3BUaVFoTmk4ZHJ6VHIx?=
 =?utf-8?B?QW9DbWpCamtqOEZuNkZ3dE5nb3RRWGlQaWdVNDI4bjlwVjNQeUlvZnZ5ZzRw?=
 =?utf-8?B?Z3Brd28xM2lRdHlzelB5Z0xDKzhTN2hkR1ZoMDBudXhDOVRiUnF6TS9TdlhK?=
 =?utf-8?B?b1A1eURHK20zZlBBa0xDNkQwNjhDeDJkdDZodW52MUE5OUdjRGJMMXR0VE9i?=
 =?utf-8?B?NXJsNFRmbkkvWVB3TXFyZVFOSHZpV2FRcnF4ZThWZFkzUjh5dkRXRnVuWkhn?=
 =?utf-8?B?SW9nczhZY0Q5Wm01UkhQT1BKWUN3YmJZTldnd0k1bnVTaDJQQm1CSnBEaTlL?=
 =?utf-8?B?eHp2dXhCS0dZc255SmVGNW5oNUs5Y1h4NjhkUEsyZWduVXo3MnFJZWIxOURE?=
 =?utf-8?B?S1RNQmVMNlRNVmMrMU1EekZ0bEtLVXhSblBLakdOQ2lhYWFPazFmRzNWNDlX?=
 =?utf-8?B?RG9MY0N2ZzYyc0lUWEVFRlV1Yml1c2RiaXI0SkJtODFDeUhYVXQ3S1VuSW9v?=
 =?utf-8?B?ditLWmgveTgvQ2k3Wkdwb0FiK0xZaHYzeldyRm1Fd1E5aUxDZmx5SUp4b3JF?=
 =?utf-8?B?Ukd5a25WWjFnV2FwbmZ5TkhRdTNDQ2lSb29wYVRMdWQ3aVM5U0xHYzE2TDN2?=
 =?utf-8?B?QjAwU290RVZoT0RwZ0d3bWR5ZnhUYTBZejNkSHE3OFlXdFdqZjZickhhOXpF?=
 =?utf-8?B?b0psanJVNWh0czhiNzN0SDUxRlNVWk1GSXdWRHdWbS9VQ2htVWhpeEJuTDN0?=
 =?utf-8?B?SUhtOTNiRTltSzZCbVlCbTNZYjBNSzE2UmZRUkRjdTlDUVhib0tJNHVLRXlY?=
 =?utf-8?B?LzZ6enBJS1UrSGlEaGg3Wk5tV1JHaHRoSGl4ZGxKT0RGVHZIenM1RStKZmta?=
 =?utf-8?B?L3NzNFB6N0dxbzlrUDA2dXZYZW5oOW5HbzVqOGlSZGJHTWJTdnJSVU9RZW5y?=
 =?utf-8?B?SWRvbDNXWjVpMTNmY2JOTmVKV1A2YTVkWHFDbnF5dmhEcDM1dzNGTnRoU3Aw?=
 =?utf-8?B?VVBLMDA3TWhFV2hTNi9XazczT29ZQjk1ekN6ZVpFSVpiT0JuTjEvNVVEQllS?=
 =?utf-8?B?eThBZ1Q5b1BLYSsvRUVIVXhJbm1xd3o0dldxdXJCUXE2S3d0bzFUbFNTdy94?=
 =?utf-8?B?cmZXV2FKMFVRaTBWLzJldE5QQXIwUlh0eDQ5ajBwdTZFMndVdGc1UGtOT1R5?=
 =?utf-8?B?aFZZa01YN2Jib1FOK1BzVERWYnkxbEkyQWJac1VWaVMvaXJyd0dzYmhvREpN?=
 =?utf-8?B?Ri92M29wS3JYSFFqQWQremYwY2JPOXh5TzBtZk5wVzNwenpnREpJeXhPZmlh?=
 =?utf-8?B?SWlvNE9GZXQwK3JvOURscmpsSW9JalhlTEkrQjlERmc5OXhiRndHQ2NJMXMy?=
 =?utf-8?B?MTRnWnJmM0VVWVVPQ1VZMHNJKzZtK3Z1ZzR1cmVTNGViekVLNno3TktaWCt2?=
 =?utf-8?B?ZHo1TzJBajREN3h5RVB4cEJ6d1d2MFFrYU9uNXk0SHByVUNrdWg0YXdiaUQz?=
 =?utf-8?B?dnFwUjJYUW93M3J6U2NhMUIyTHFGZjZsK2pEc2x5dDRyWVNZMnNFZzRFNFBv?=
 =?utf-8?B?UmxpMzJwODlVK0lYSUdEalZvb2M2OHlsbFl5bG03S0ZNWkpVY1JoekhvV3dH?=
 =?utf-8?B?a0FsTldEQ1ZRb3ZkZmdEOWZGVm8zRzBKVkRleU5LbHFwUlVYdHBGeVhKbEpv?=
 =?utf-8?B?YWdkVk5LL1BxdWx6V1JPalhCK0VxRHZCUFIyWS9DV0ZWbDZsZUFmZFpHSTJm?=
 =?utf-8?B?SFVuMysxeDY2aEwwUGV6bU56NjlvcU1oYURXWEVoWGc4dG16dWhwV3NXblpm?=
 =?utf-8?B?dXBRdE4vM29VbXdRaXRkR0IyeWRqZGZ4UVRvTkRzdWZsMG9lREhpT0Y5L0Vw?=
 =?utf-8?B?QTVQZ3JBTytvL01GYmlka1VGbndTc0dJVXNqMHp2VTU3YUY2TVpLUG5RUVY0?=
 =?utf-8?B?K0RqT0l1SHY3b090YnRLblloRVUyUVBVUGxLT0JtWkUvZGpGSll5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44271f06-7127-4522-db4b-08df454f4ddd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB9060.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:38:22.5265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICZ+PW1Xc+NXtbGo4MJNQ3/XvDzDgs47U4UjmkaxL74TIAU5oTcieItUJiMYTJQ9cFAVhc3p9I8wHqJP9kAlrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7783

Hi David,

On 11/17/2026 6:46 PM, David Laight wrote:
> On Tue, 17 Nov 2026 13:09:47 +0530
> Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:
> 
>> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
>> 16-byte field and does not guarantee NUL termination. A 16-character
>> name fills the entire field.
>> The driver copies this field into a 16-byte buffer and subsequently
>> uses it as a C string. For a non-NUL-terminated name, string operations
>> can read past the end of the buffer into the adjacent groups pointer.
>>
>> Reserve an extra byte for the NUL terminator and explicitly terminate
>> the copied function name.
>>
>> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>> ---
>>   drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
>> index aba129ead04c..c778133fadc2 100644
>> --- a/drivers/pinctrl/pinctrl-zynqmp.c
>> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
>> @@ -29,7 +29,11 @@
>>   
>>   #define ZYNQMP_PIN_PREFIX			"MIO"
>>   #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
>> -#define MAX_FUNC_NAME_LEN			16
>> +/*
>> + * Firmware returns the name in a fixed-size field and does not guarantee a
>> + * NUL terminator. Keep one extra byte for the NUL terminator.
>> + */
>> +#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
>>   #define MAX_GROUP_PIN				50
>>   #define MAX_PIN_GROUPS				50
>>   #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
>> @@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
>>   	 */
>>   	zynqmp_pm_query_data(qdata, payload);
>>   	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
>> +	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';
> 
> Too many constants....
> You might want to try embedding 'name' in a structure.
> 
> Then, at least, you can use sizeof().
Ok, i will define the below structure

struct zynqmp_func_name {
        char name[ZYNQMP_FUNC_NAME_LEN];
        char nul;
};

and initialize them as below.

memcpy(fname->name, payload, sizeof(fname->name));
fname->nul = '\0';

Regards
Sai Krishna

> 
> David
> 
> 
>>   }
>>   
>>   static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)
> 

